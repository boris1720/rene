var express = require('express');
var router = express.Router();

/* GET o nama page. */
router.get('/', function(req, res, next) {
    res.render('onama', { title: 'O nama' });
});

module.exports = router;