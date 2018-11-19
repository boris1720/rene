var express = require('express');
var router = express.Router();

/* konekcija na bazu */
var mysql      = require('mysql');
var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'rene'
});

connection.connect();

var loggedin = function (req, res, next) {
    if (req.isAuthenticated()) {
        next()
    } else {
        res.redirect('/login')
    }
}

/* GET home page. */
router.get('/recepti',loggedin, function (req, res, next) {
    var user = req.user;
    connection.query('SELECT id FROM `user` WHERE username = ?',user.username, function(err, author_id) {
        console.log(author_id.id);
        res.render('backend/createrecepti', {
        user: req.user,
        ct_id: 1,
        author_id: author_id,
        title: 'Rene Vegan'
    });
    });
});

router.get('/clanci',loggedin, function (req, res, next) {
    var user = req.user;
    connection.query('SELECT id FROM `user` WHERE username = ?',user.username, function(err, author_id) {
        res.render('backend/createrecepti', {
            user: req.user,
            ct_id: 2,
            author_id: author_id,
            title: 'Rene Vegan'
        });
    });
});

router.post('/submitr', function (req, res, next) {
    var today = new Date();
    var sql = "INSERT INTO `content` SET ?";
    var post  = {title: req.body.title, description: req.body.description, content_text:req.body.content_text, image:req.body.image, author_id:req.body.author_id, ct_id:req.body.ct_id,category_id:req.body.category_id, slug:req.body.slug, created_on:today };
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