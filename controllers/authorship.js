const router = require('express').Router();
const { Blog, User } = require('../models');
const { SECRET } = require('../util/config');
const jwt = require('jsonwebtoken');
const { Op } = require('sequelize');
const { route } = require('./login');
const { sequelize } = require('../util/db');

//middleware to extract token from request
const tokenExtractor = (req, res, next) => {
    //what does req.get do below???
    const authorization = req.get('authorization');
    if (authorization && authorization.toLowerCase().startsWith('bearer ')) {
        try {
            req.decodedToken = jwt.verify(authorization.substring(7), SECRET);
        } catch {
            return res.status(401).json({ error: 'token invalid' });
        }
    } else {
        console.log(authorization);

        return res.status(401).json({ error: 'token missing' });
    }
    next();
}

router.get('/', async (req, res) => {
    const authorSummary = await sequelize.query(
        `SELECT users.name, COUNT(*) AS "number_of_blogs", SUM(likes) AS "total_likes"
            FROM(
                Users INNER JOIN blogs 
                ON Users.id = blogs.user_Id)
            GROUP BY users.id;`);
    res.json(authorSummary);

})


module.exports = router;