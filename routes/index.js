var express = require('express');
var router = express.Router();

/* konekcija na bazu */
var mysql      = require('mysql');
var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'it255'
});

connection.connect();

var loggedin = function (req, res, next) {
  if (req.isAuthenticated()) {
    next()
  } else {
    res.redirect('/login')
  }
}

/* GET home page. */
/* GET index page.
* SQL upit za poslednje tri vesti */
connection.query('SELECT * from vesti ORDER BY vesti_id DESC LIMIT 3', function(err, rows) {
    if (!err){
        router.get('/', function(req, res, next) {
            res.render('index', { title: 'Rene Vegan', data: rows });

        });
    }
    else{
        console.log('Error while performing Query.');
    }
});


router.get('/login', function (req, res, next) {
  res.render('login');
});


router.get('/signup', function (req, res, next) {
  res.render('signup');
});


router.get('/profile', loggedin, function (req, res, next) {
  res.render('profile', {
    user: req.user
  })
});


router.get('/logout', function (req, res) {
  req.logout()
  res.redirect('/')
})
module.exports = router;