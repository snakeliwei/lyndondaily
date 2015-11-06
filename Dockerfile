FROM smebberson/alpine-nodejs

MAINTAINER lyndon <snakeliwei@qq.com>

# Install express
RUN npm install -g express-generator

# Set development environment as default
RUN mkdir /opt && cd /opt
RUN express -e lyndondaily
RUN cd /opt/lyndondaily
RUN npm install
RUN npm install nodemon -g

WORKDIR /opt/lyndondaily
# Port 3000 for server
EXPOSE 3000
CMD ["nodemon"]