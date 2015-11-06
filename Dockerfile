FROM smebberson/alpine-nodejs

MAINTAINER lyndon <snakeliwei@qq.com>

# Install express
RUN npm install -g express-generator
RUN npm install -g nodemon

# Set development environment as default
RUN express -e lyndondaily
workdir /lyndondaily
RUN cd lyndondaily && npm install && npm install wechat --save

ADD app.js /lyndondaily/app.js


# Port 80 for server
EXPOSE 80
CMD ["nodemon"]

