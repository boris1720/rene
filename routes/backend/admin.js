var express = require('express');
var router = express.Router();

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
router.get('/',loggedin, function (req, res, next) {
    res.render('backend/admin', {
        user: req.user,
        title: 'Rene Vegan'
    });
});


module.exports = router;