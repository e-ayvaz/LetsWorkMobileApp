var mongoose = require('mongoose')
mongoose.connect('mongodb://localhost/university',{useNewUrlParser:true})
var db = require('../Database/dbConnection');
var university = require('../models/university.model');




router.get('/university', function (req, res) {
    db.use("University").find(function (err, response) {
        if (err) {
            console.log(err)
        }
        // Pass the DB result to the template
        res.render('index', { dropdownVals: response })
    });
});

module.exports = router;