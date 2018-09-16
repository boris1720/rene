var express = require('express');
var router = express.Router();

var loggedin = function (req, res, next) {
    if (req.isAuthenticated()) {
        next()
    } else {
        res.redirect('/login')
    }
}

/* konekcija na bazu */
var mysql      = require('mysql');
var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'it255'
});

connection.connect();

/* GET users page. */
router.get('/',loggedin, function(req, res, next) {
    var sql = "SELECT * from users";
    connection.query(sql, function(err, rows) {
        if (!err) {
            res.render('backend/users', { title: 'Users', data: rows });
        }
        else {
            console.log('Error while performing Query.');
        }

    });
});

module.exports = router;
