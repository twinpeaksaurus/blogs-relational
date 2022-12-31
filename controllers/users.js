const router = require('express').Router();
const { User } = require('../models');

router.post('/', async (req, res) => {
    try {
        const user = await User.create(req.body);
        return res.json(user);
    } catch (e) {
        return res.status(400).json(e)
    }
});

router.get('/', async (req, res) => {
    const users = await User.findAll();
    res.json(users);
});

module.exports = router;