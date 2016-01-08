var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');

var routes = require('./routes/index');
var users = require('./routes/users');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', routes);
app.use('/users', users);
var wechat = require('wechat');

var config = {
  token: 'liwei1983',
  appid: 'wxe4ab816a29f5db33',
  encodingAESKey: 'N7VT8M30KgiuL0blQ11Ht1ET1XTQR2VJD6Js4Lso04e'
};

app.use(express.query());
app.use('/wechat', wechat(config, function (req, res, next) {
  // 微信输入信息都在req.weixin上
  var message = req.weixin;
  if (message.FromUserName === 'diaosi') {
    // 回复屌丝(普通回复)
    res.reply('hehe');
    } else if (message.FromUserName === 'text') {
      //你也可以这样回复text类型的信息
      res.reply({
        content: 'text object',
        type: 'text'
        });
      } else if (message.FromUserName === 'hehe') {
        // 回复一段音乐
          res.reply({
            type: "music",
            content: {
              title: "来段音乐吧",
              description: "一无所有",
              musicUrl: "http://mp3.com/xx.mp3",
              hqMusicUrl: "http://mp3.com/xx.mp3",
              thumbMediaId: "thisThumbMediaId"
            }
            });
        } else {
          // 回复高富帅(图文回复)
          res.reply([
              {
                title: '最新blog文章',
                description: 'lyndon\'s blog',
                picurl: 'http://snakeliwei.github.io/images/nodejs.jpg',
                url: 'http://snakeliwei.github.io/'
              }
            ]);
          }
      }));

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: err
    });
  });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
  res.status(err.status || 500);
  res.render('error', {
    message: err.message,
    error: {}
  });
});

app.listen(80);
module.exports = app;
