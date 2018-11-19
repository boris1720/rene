var express = require('express');
var router = express.Router();
var moment = require('moment');

/* konekcija na bazu */
var mysql      = require('mysql');
var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'rene'
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
connection.query('SELECT content.id, content.title, content.description, content.created_on, user.username, image.filename FROM content LEFT JOIN user ON user.id=content.author_id LEFT JOIN category ON category.id=content.category_id LEFT JOIN image ON image.id=content.image WHERE content.ct_id=2 ORDER BY content.created_on DESC LIMIT 3  ', function(err, rows) {
    if (!err){
        connection.query('SELECT content.id, content.title, content.description, content.created_on, user.username, category.name,category.slug, image.filename FROM content LEFT JOIN user ON user.id=content.author_id LEFT JOIN category ON category.id=content.category_id LEFT JOIN image ON image.id=content.image WHERE content.ct_id=1 ORDER BY content.created_on DESC LIMIT 6 ', function(err, rows2) {
            router.get('/', function(req, res, next) {

                res.render('index', { title: 'Rene Vegan v2.0', data: rows, data2: rows2, moment: moment });
            });
        });
    }
    else{
        console.log('Error while performing Querydd.');
    }

});

router.get('/onama', function (req, res, next) {
    res.render('onama', {
        title: 'Rene Vegan'
    });
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