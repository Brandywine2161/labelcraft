#this removes ALL containers (bad if hosting ANY containers on it besides the actual application)
#for i in  `docker ps -q`; do docker stop $i; done
#docker rm `docker ps --no-trunc -aq`

docker rm -f frontend
#docker rm -f api
#docker rm -f pgdb

#While these remove old images, we might not want them to be run every build since deletion takes time
#sudo docker ps -a -q --filter "status=exited"
#sudo docker rmi `sudo docker images -q --filter "dangling=true"`
