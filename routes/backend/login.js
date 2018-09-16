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



/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('backend/login', { title: 'Admin', msg: '' });
});

/* POST login */
router.post('/submit', function (req, res, next) {
    var sql = "SELECT * from users";
    connection.query(sql, function(err, rows) {
        if (!err) {
            let post  = {username: req.body.username, password: req.body.password };
            rows.forEach(function (users) {
                if(users.username === post.username){
                    if(users.password === post.password){
                        res.render('backend/admin', { title: 'Admin'});
                    }
                    else{
                        res.render('backend/login', { title: 'Admin', msg: 'greska!'});
                    }
                }
                else{
                    res.render('backend/login', { title: 'Admin', msg: 'greska!'});
                }
            })
        }
        else {
            console.log('Error while performing Query.');
        }
    });
});




module.exports = router;
