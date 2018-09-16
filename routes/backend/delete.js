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

/* delete vest */
router.get('/:id', function(req, res, next) {
    var sql = "DELETE FROM `vesti` WHERE `vesti`.`vesti_id` = ?";
    var id = req.param("id");
    connection.query(sql ,id , function(err, rows) {
        if (!err) {
            res.redirect('/list');
        }
        else {
            console.log('Error while performing Query.');
        }

    });
});


module.exports = router;











