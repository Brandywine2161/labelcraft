# labelcraft / gridiron

![Team](https://github.com/GridIron/labelcraft/blob/master/teamresources/gridiron.png)

#Install Guide

Building this project is made easy with Docker, the following instruction sets will get you up and running in no time. 

####Install Docker
Go to https://docs.docker.com/ and install docker on your computer.

####Run Build Script for entire prototype
* Ensure Docker is running successfully on your machine (`Docker ps` should not return an error)
* Clone the repository
* cd into the `bin` folder
* Run `sudo bash build.sh`. This will run front end, api, and database containers. 

Once all containers are running, you can put localhost:3000 in the browser to see the website. 

####Run Docker Container Services Manually
* Clone the repository
* Go inside the project folder
* `docker build -t frontend www`
* `docker run -p 9000:9000 -d frontend`. In your browser, type in localhost:9000 and you will be able to see front end content. 
* `docker build -t database api/database/postegres`
* `docker run --name pgdb -p 5432:5432 -d database`
* `docker build -t api api`
* `docker run -p 3000:3000 --link pgdb:db -e "RAILS_ENV=docker" -d api`<br>

Once all containers are running, you can put localhost:3000 in the browser to see the website.

#####Production Ready Concerns -- 

Things to consider in a production environment 

- Scaling: elastically growing and shrinking the computing resources required by the amount of requests coming in
- Logging: take into account how logs are being stored, evaluated and acted on.
- Backups: making sure you have something to roll back to when the chaos monkeys grow too strong
- Monitoring: Logs, won't give you everything -- what else do you need real time information on
- Security: TLS, Certs, firewalls, DoS, XSS, and more... 

Its a lot to take in, good thing we don't need to start from scratch, check [this out](http://shipyard-project.com/)...

