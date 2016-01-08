FROM alpine:3.2
MAINTAINER lyndon <snakeliwei@qq.com>

# Install Node
RUN apk --update add nodejs \
    && rm -rf /var/cache/apk/* \
# Install express
    && npm install -g express-generator \
    && npm install -g nodemon \

# Set development environment as default
    && express -e lyndondaily \
    && cd lyndondaily \ 
    && npm install \ 
    && npm install wechat -save

ADD app.js /lyndondaily/app.js
WORKDIR /lyndondaily

# Port 80 for server
EXPOSE 80

CMD ["nodemon"]

