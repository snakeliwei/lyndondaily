FROM smebberson/alpine-nodejs

MAINTAINER lyndon, snakeliwei@qq.com

# Install express
RUN npm install -g express-generator



# Set development environment as default
ENV NODE_ENV development

# Port 3000 for server
# Port 35729 for livereload
EXPOSE 3000 35729
CMD ["grunt"]
