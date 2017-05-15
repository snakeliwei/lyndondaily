FROM alpine:3.5
MAINTAINER lyndon <snakeliwei@qq.com>

# Install Node
RUN apk --update add nodejs \
    && rm -rf /var/cache/apk/* \
    && npm install -g express-generator

# Set development environment as default
    && express -e lyndondaily \
    && cd lyndondaily \ 
    && npm install \ 
    && npm install wechat -save

ADD app.js /lyndondaily/app.js
WORKDIR /lyndondaily

# Port 80 for server
EXPOSE 80

CMD ["node", "app.js"]

