/**
 * Thank you for viewing this tuorial.
 * 
 * Aman Kharbanda
 * YouTube: https://bit.ly/2EudQ5Z
 */


var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var mongoose = require('mongoose');
var session = require('express-session');
var passport = require('passport');

require('./passport')(passport)

mongoose.connect('mongodb://localhost:27017/rene')



var index = require('./routes/index');
var users = require('./routes/users');
var auth = require('./routes/auth')(passport);

/* rute */

var indexRouter = require('./routes/index');
var vesti = require('./routes/vesti');
var vest  = require('./routes/vest');
var recepti = require('./routes/recepti');
var recept = require('./routes/recept');
var onama = require('./routes/onama');
var kontakt = require('./routes/kontakt');

var login = require('./routes/backend/login');
var admin = require('./routes/backend/admin');
var create = require('./routes/backend/create');
var createrecepti = require('./routes/backend/createrecepti');
var users = require('./routes/backend/users');
var update = require('./routes/backend/update');
var updaterecepti = require('./routes/backend/updaterecepti');
var del = require('./routes/backend/delete');
var delrec = require('./routes/backend/deleterecepti');
var list = require('./routes/backend/list');
var listrecepti = require('./routes/backend/listrecepti');
var messages = require('./routes/backend/poruke');

/* konekcija na bazu */
var mysql      = require('mysql');
var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'it255'
});

connection.connect();

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: false
}));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(session({
  secret: 'thesecret',
  saveUninitialized: false,
  resave: false
}))

app.use(passport.initialize())
app.use(passport.session())

app.use('/users', users);
app.use('/auth', auth);
app.use('/', indexRouter);
app.use('/vesti', vesti);
app.use('/vest', vest);
app.use('/recepti', recepti);
app.use('/recept', recept);
app.use('/onama', onama);
app.use('/kontakt', kontakt);

app.use('/login', login);
app.use('/admin', admin);
app.use('/create', create);
app.use('/createrecepti', createrecepti);
app.use('/users', users);
app.use('/update', update);
app.use('/updaterecepti', updaterecepti);
app.use('/delete', del);
app.use('/deleterecepti', delrec);
app.use('/list', list);
app.use('/listrecepti', listrecepti);
app.use('/messages', messages);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});
console.log("Radi");
module.exports = app;