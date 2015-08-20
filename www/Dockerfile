FROM ubuntu:14.04
 
RUN mkdir /usr/src/app && mkdir /usr/src/app/client
#RUN mkdir /usr/src/app/client
WORKDIR /usr/src/app/client


RUN apt-get update && apt-get install -y git npm nodejs && apt-get install -y build-essential chrpath git-core libssl-dev libfontconfig1-dev

RUN npm install -g bower
			#grunt-cli /
			#grunt /
			#&& apt-get install -y ruby-dev /
			#&& gem install compass /
			#&& ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g grunt-cli
RUN npm install -g grunt

RUN apt-get install -y ruby-dev
RUN gem install compass
RUN ln -s /usr/bin/nodejs /usr/bin/node
#RUN mkdir /usr/src/app/client
COPY bower.json /usr/src/app/client/
RUN bower install --allow-root
COPY package.json /usr/src/app/client/
RUN npm install
COPY Gruntfile.js /usr/src/app/client/
CMD grunt dev
COPY . /usr/src/app/client
EXPOSE 9000
