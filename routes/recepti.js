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

/* GET recepti page. */
connection.query('SELECT * from recepti', function(err, rows) {
    if (!err){
        router.get('/', function(req, res, next) {
            res.render('recepti', { title: 'Recepti', data: rows });
        });
    }
    else{
        console.log('Error while performing Query.');
    }
});

router.get('/:category', function(req, res, next) {
    var sql = "SELECT * from recepti WHERE category = ?";
    var cat = req.param("category");
    connection.query(sql ,cat , function(err, rows) {
        if (!err) {
            res.render('recepti', {title: 'Recepti', cat: cat, data: rows});
        }
        else {
            console.log('Error while performing Query.');
        }
    });
});

module.exports = router;
