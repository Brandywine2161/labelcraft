docker build -t frontend ../www
sleep 2
docker run --name frontend -p 80:9000 -d frontend
docker build -t database ../api/database/postgres
sleep 2
docker run --name pgdb -p 5432:5432 -d database
docker build -t api ../api
# There is a timing issue here, and the sleep is to account for it. The front end was not hooking up with database in time.
sleep 2
docker run --name api -p 3000:3000 --link pgdb:db -e "RAILS_ENV=docker" -d api
sleep 2
docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor \
  google/cadvisor:latest
