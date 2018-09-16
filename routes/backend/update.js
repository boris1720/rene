var express = require('express');
var multer = require('multer');
var path = require('path');
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

/* UPDATE vesti  */
router.get('/:id',loggedin, function(req, res, next) {
    var sql = "SELECT * from vesti WHERE vesti_id = ?";
    var id = req.param("id");
    connection.query(sql ,id , function(err, rows) {
        if (!err) {
            res.render('backend/update', {title: 'Admin', id: id, data: rows});
        }
        else {
            console.log('Error while performing Query.');
        }
    });
});

/* POST update page. */
router.post('/submit', function (req, res, next) {

    var sql = "UPDATE `vesti` SET ? WHERE vesti_id = ?";
    var id = req.body.id;
    var post  = {title: req.body.title, description: req.body.description, img: req.body.img, author:req.body.author};
    connection.query(sql,[post,id], function (err, result) {
        if (!err) {

            res.redirect('/list');
        }
        else {
            console.log(err);
        }
    });

});

module.exports = router;
