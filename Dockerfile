FROM node

MAINTAINER lyndon <snakeliwei@qq.com>

# Install express
RUN npm install -g express-generator

# Set development environment as default
RUN express -e lyndondaily
RUN cd lyndondaily && npm install

# Start app
RUN cd lyndondaily && node app.js
# Port 3000 for server
EXPOSE 3000

