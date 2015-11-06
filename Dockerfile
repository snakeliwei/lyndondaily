FROM smebberson/alpine-nodejs

MAINTAINER lyndon <snakeliwei@qq.com>

# Install express
RUN npm install -g express-generator
RUN npm install -g nodemon

# Set development environment as default
RUN express -e lyndondaily
RUN cd lyndondaily && npm install

workdir /lyndondaily
# Port 3000 for server
EXPOSE 3000
CMD ["nodemon"]

