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

/* GET kontakt page. */
router.get('/', function(req, res, next) {
    res.render('kontakt', { title: 'Kontakt' });
});
/* POST submit poruke */
router.post('/submit', function (req, res, next) {

    let sql = "INSERT INTO `poruke` SET ?";
    let post  = {name: req.body.ime, message: req.body.poruka, email: req.body.email };
    connection.query(sql,post, function (err, result) {
        if (!err) {
            res.redirect('/kontakt');
        }
        else {
            console.log(err);
        }
    });

});

module.exports = router;