FROM smebberson/alpine-nodejs

MAINTAINER lyndon <snakeliwei@qq.com>

# Install express
RUN npm install -g express-generator
RUN npm install -g nodemon

# Set development environment as default
RUN express -e lyndondaily
ADD app.js /lyndondaily/app.js
ADD package.json /lyndondaily/package.json
RUN cd lyndondaily && npm install

workdir /lyndondaily
# Port 80 for server
EXPOSE 80
CMD ["nodemon"]

