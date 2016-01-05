FROM alpine
MAINTAINER lyndon <snakeliwei@qq.com>

# Install Node
RUN apk --update add nodejs python make g++
# Install express
RUN npm install -g express-generator \
    && npm install -g nodemon \

# Set development environment as default
    && express -e lyndondaily \
    && cd lyndondaily \ 
    && npm install \ 
    && npm install wechat -save

ADD app.js /lyndondaily/app.js

workdir /lyndondaily
# Port 80 for server
EXPOSE 80
CMD ["nodemon"]

