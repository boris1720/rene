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

/* GET vest page. */
router.get('/:id', function(req, res, next) {
    var sql = "SELECT * from vesti WHERE vesti_id = ?";
    var id = req.param("id");
    connection.query(sql ,id , function(err, rows) {
        if (!err) {
            res.render('vest', {title: 'Vesti', id: id, data: rows});
        }
        else {
            console.log('Error while performing Query.');
        }
    });
});
module.exports = router;