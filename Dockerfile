FROM node:6

# Create app directory
RUN mkdir -p /var/app/current
ADD . /var/app/current
WORKDIR /var/app/current

# Install app dependencies
RUN npm install

EXPOSE 8080
EXPOSE 61109

# ENV DB_URL mongodb://dev:Kiddoo-123@ds123930.mlab.com:23930/
# ENV CLIENT_URL http://kiddoowebapp-docker-env-dev.eu-west-1.elasticbeanstalk.com
#ENV CLIENT_URL *

CMD [ "npm", "run", "dev" ]
