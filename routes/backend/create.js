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

var loggedin = function (req, res, next) {
    if (req.isAuthenticated()) {
        next()
    } else {
        res.redirect('/login')
    }
}





/* GET create page. */
router.get('/', loggedin, function(req, res, next) {

    res.render('backend/create', {title: 'Create'});
});

/* POST submit */
router.post('/submit', function (req, res, next) {

    let sql = "INSERT INTO `vesti` SET ?";
    let post  = {title: req.body.title, description: req.body.description, img: req.body.img, author:req.body.author };
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








