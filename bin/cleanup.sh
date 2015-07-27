for i in  `docker ps -q`; do docker stop $i; done
docker rm `docker ps --no-trunc -aq`
sudo docker ps -a -q --filter "status=exited"
sudo docker rmi `sudo docker images -q --filter "dangling=true"`
