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

/* GET createrecepti page. */
router.get('/', loggedin, function(req, res, next) {
    res.render('backend/createrecepti', {title: 'Create'});
});

/* POST submit */
router.post('/submit', function (req, res, next) {

    let sql = "INSERT INTO `recepti` SET ?";
    let post  = {title: req.body.title, sastojci: req.body.sastojci, description: req.body.description, img: req.body.img, author:req.body.author, category:req.body.category };
    connection.query(sql,post, function (err, result) {
        if (!err) {
            res.redirect('/admin');
        }
        else {
            console.log(err);
        }
    });
});

module.exports = router;
