const router = require('express').Router();
const { sequelize } = require('../util/db');

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