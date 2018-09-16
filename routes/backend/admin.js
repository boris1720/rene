var express = require('express');
var router = express.Router();

var loggedin = function (req, res, next) {
    if (req.isAuthenticated()) {
        next()
    } else {
        res.redirect('/login')
    }
}

/* GET admin page. */
router.get('/', loggedin,function(req, res, next) {
    res.render('backend/admin', { title: 'Admin', user: req.user });
});

module.exports = router;