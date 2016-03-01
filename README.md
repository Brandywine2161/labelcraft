# labelcraft / gridiron

![Team](https://github.com/GridIron/labelcraft/blob/master/teamresources/gridiron.png)

#Install Guide

Building this project is made easy with Docker, the following instruction sets will get you up and running in no time. 

###Prerequisites
Install [Docker](https://docs.docker.com/) and [Docker Compose](https://docs.docker.com/compose/) on your computer.

###Build options:

####(1) Build and run Labelcraft with Docker Compose

```shell
git clone https://github.com/Brandywine2161/labelcraft.git
cd labelcraft
docker-compose up -d
```

* In your browser, type in http://localhost and you will be able to see front end content.

####(2) Run Build Script for entire prototype
* Ensure Docker is running successfully on your machine (`Docker ps` should not return an error)

```shell
git clone https://github.com/Brandywine2161/labelcraft.git
cd labelcraft/bin
sudo bash build.sh
```

* This will run front end, api, and database containers. 

* In your browser, type in http://localhost and you will be able to see front end content.

####(3) Run Docker Container Services Manually

```shell
git clone https://github.com/Brandywine2161/labelcraft.git
cd labelcraft

docker build -t frontend www
docker run -p 80:9000 -d frontend

docker build -t database api/database/postegres
docker run --name pgdb -p 5432:5432 -d database

docker build -t api api
docker run -p 3000:3000 --link pgdb:db -e "RAILS_ENV=docker" -d api
```

* In your browser, type in http://localhost and you will be able to see front end content.

#####Production Ready Concerns -- 

Things to consider in a production environment 

- Scaling: elastically growing and shrinking the computing resources required by the amount of requests coming in
- Logging: take into account how logs are being stored, evaluated and acted on.
- Backups: making sure you have something to roll back to when the chaos monkeys grow too strong
- Monitoring: Logs, won't give you everything -- what else do you need real time information on
- Security: TLS, Certs, firewalls, DoS, XSS, and more... 

Its a lot to take in, good thing we don't need to start from scratch, check [this out](http://shipyard-project.com/)...

###Selenium Testing
As a consumer of prescription and over-the-counter drugs, I want to check drug side effects and possibly improve drug labels so that I can make informed decisions when purchasing and consuming drugs. Our main focus on testing was to make sure that all tools on the website where functional. We based our tests off our assumptions of how this application should function.   

* Verify you are on the correct page after a certain action
* Verify that all buttons work (not related to the graph)
* Verify that the following links work (at the bottom of the site)
	http://open.fda.gov/  
	https://dev.labelcraft.io:3000/documentation/  
	https://dev.labelcraft.io/#  
* Verify the capability to do multiple searches without going to the main url
* Verify the user cannot search non-exisitent drugs
* Verify that all the tabs work
* Verify that the leadersboard updates after a form submission
* Verify that the format of the form is correct, if not verify that an error message was displayed
* Verify the completion of a form
* Verify that the url corresponds with the tab
* Verify that the correct drug name is listed on all pages after selection
* Verify that the user interface doesn't break if the page resizes
* Verify that the bar graph is updated after a form submission or refresh
