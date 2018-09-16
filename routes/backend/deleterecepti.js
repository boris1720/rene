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

/* delete vest */
router.get('/:id', loggedin, function(req, res, next) {
    var sql = "DELETE FROM `recepti` WHERE `recepti`.`recept_id` = ?";
    var id = req.param("id");
    connection.query(sql ,id , function(err, rows) {
        if (!err) {
            res.redirect('/listrecepti');
        }
        else {
            console.log('Error while performing Query.');
        }

    });
});


module.exports = router;


