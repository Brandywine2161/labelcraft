for i in  `docker ps -q`; do docker stop $i; done
docker rmi `docker ps --no-trunc -aq`
