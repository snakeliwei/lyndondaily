FROM smebberson/alpine-nodejs

MAINTAINER lyndon <snakeliwei@qq.com>

# Install express
RUN npm install -g express-generator
RUN npm install -g nodemon

# Set development environment as default
workdir /opt
RUN express -e lyndondaily
ADD app.js /opt/lyndondaily
ADD package.json /opt/lyndondaily
RUN cd lyndondaily && npm install

# Port 80 for server
EXPOSE 80
CMD ["nodemon"]

