var express = require('express');
var router = express.Router();
var moment = require('moment');

/* konekcija na bazu */
var mysql      = require('mysql');
var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'rene'
});

connection.connect();


/* GET home page. */
connection.query('SELECT content.id, content.title, content.description, content.image, content.created_on, user.username, category.name, image.filename FROM content LEFT JOIN user ON user.id=content.author_id LEFT JOIN category ON category.id=content.category_id LEFT JOIN image ON image.id=content.image  WHERE content.ct_id=1', function(err, rows) {
    if (!err){
        connection.query('SELECT * FROM `category` ', function(err, rows2) {
            router.get('/', function(req, res, next) {

                res.render('receptilist', { title: 'Rene Vegan', data: rows, data2: rows2, moment: moment });
            });
        });}
    else{
        console.log('Error while performing Querydd.');
    }

});

router.get('/dorucak', function(req, res, next) {
    var sql = "SELECT content.id, content.title, content.description, content.image, content.created_on, user.username, category.name, image.filename FROM content LEFT JOIN user ON user.id=content.author_id LEFT JOIN category ON category.id=content.category_id LEFT JOIN image ON image.id=content.image  WHERE content.category_id=1";
    connection.query(sql , function(err, rows) {
        if (!err) {

            connection.query('SELECT * FROM `category` ', function(err, rows2) {

                res.render('receptilist', { title: 'Rene Vegan', data: rows, data2: rows2, moment: moment });

            });
        }
        else {
            console.log('Error while performing Query.');
        }
    });
});

router.get('/rucak', function(req, res, next) {
    var sql = "SELECT content.id, content.title, content.description, content.image, content.created_on, user.username, category.name, image.filename FROM content LEFT JOIN user ON user.id=content.author_id LEFT JOIN category ON category.id=content.category_id LEFT JOIN image ON image.id=content.image  WHERE content.category_id=2";
    connection.query(sql , function(err, rows) {
        if (!err) {

            connection.query('SELECT * FROM `category` ', function(err, rows2) {

                res.render('receptilist', { title: 'Rene Vegan', data: rows, data2: rows2, moment: moment });

            });
        }
        else {
            console.log('Error while performing Query.');
        }
    });
});

router.get('/vecera', function(req, res, next) {
    var sql = "SELECT content.id, content.title, content.description, content.image, content.created_on, user.username, category.name, image.filename FROM content LEFT JOIN user ON user.id=content.author_id LEFT JOIN category ON category.id=content.category_id LEFT JOIN image ON image.id=content.image  WHERE content.category_id=3";
    connection.query(sql , function(err, rows) {
        if (!err) {

            connection.query('SELECT * FROM `category` ', function(err, rows2) {

                res.render('receptilist', { title: 'Rene Vegan', data: rows, data2: rows2, moment: moment });

            });
        }
        else {
            console.log('Error while performing Query.');
        }
    });
});

router.get('/dezerti', function(req, res, next) {
    var sql = "SELECT content.id, content.title, content.description, content.image, content.created_on, user.username, category.name, image.filename FROM content LEFT JOIN user ON user.id=content.author_id LEFT JOIN category ON category.id=content.category_id LEFT JOIN image ON image.id=content.image  WHERE content.category_id=5";
    connection.query(sql , function(err, rows) {
        if (!err) {

            connection.query('SELECT * FROM `category` ', function(err, rows2) {

                res.render('receptilist', { title: 'Rene Vegan', data: rows, data2: rows2, moment: moment });

            });
        }
        else {
            console.log('Error while performing Query.');
        }
    });
});

router.get('/salate', function(req, res, next) {
    var sql = "SELECT content.id, content.title, content.description, content.image, content.created_on, user.username, category.name, image.filename FROM content LEFT JOIN user ON user.id=content.author_id LEFT JOIN category ON category.id=content.category_id LEFT JOIN image ON image.id=content.image  WHERE content.category_id=4";
    connection.query(sql , function(err, rows) {
        if (!err) {

            connection.query('SELECT * FROM `category` ', function(err, rows2) {

                res.render('receptilist', { title: 'Rene Vegan', data: rows, data2: rows2, moment: moment });

            });
        }
        else {
            console.log('Error while performing Query.');
        }
    });
});

router.get('/decija', function(req, res, next) {
    var sql = "SELECT content.id, content.title, content.description, content.image, content.created_on, user.username, category.name, image.filename FROM content LEFT JOIN user ON user.id=content.author_id LEFT JOIN category ON category.id=content.category_id LEFT JOIN image ON image.id=content.image  WHERE content.category_id=6";
    connection.query(sql , function(err, rows) {
        if (!err) {

            connection.query('SELECT * FROM `category` ', function(err, rows2) {

                res.render('receptilist', { title: 'Rene Vegan', data: rows, data2: rows2, moment: moment });

            });
        }
        else {
            console.log('Error while performing Query.');
        }
    });
});

router.get('/:id', function(req, res, next) {
    var sql = "SELECT content.id, content.title, content.content_text, content.image, content.created_on, user.username, category.name, image.filename FROM content LEFT JOIN user ON user.id=content.author_id LEFT JOIN category ON category.id=content.category_id LEFT JOIN image ON image.id=content.image WHERE content.id=?";
    var id = req.param("id");
    connection.query(sql ,id , function(err, rows) {
        if (!err) {
            connection.query('SELECT * FROM `category` ', function(err, rows2) {
                connection.query('SELECT * FROM comment WHERE content_id = ? ',id, function(err, rows3) {
                    console.log(rows3);
                    res.render('receptisingle', { title: 'Rene Vegan', data: rows, data2: rows2, data3:rows3, id:id, moment: moment });
                });
            });
        }
        else {
            console.log('Error while performing Query.');
        }
    });
});

/* POST submit komentara */
router.post('/submit', function (req, res, next) {
    var today = new Date();
    var sql = "INSERT INTO `comment` SET ?";
    var post  = {author_name: req.body.author_name, comment_content: req.body.comment_content, content_id:req.body.content_id, email:req.body.email, created_on:today };
    connection.query(sql,post, function (err, result) {
        if (!err) {
                res.redirect('/clanci/' + req.body.content_id);
        }
        else {
            console.log(err);
        }
    });

});

module.exports = router;