const router = require('express').Router();
const { User } = require('../models');
const { Blog } = require('../models')

router.post('/', async (req, res) => {
    try {
        const user = await User.create(req.body);
        return res.json(user);
    } catch (e) {
        return res.status(400).json(e)
    }
});

router.get('/summary', async (req, res) => {
    const users = await User.findAll({
        include: {
            model: Blog
        }
    });
    res.json(users);
});

router.get('/', async (req, res) => {
    const users = await User.findAll({
        include: {
            model: Blog
        }
    });
    res.json(users);
});

router.put('/:username', async (req, res) => {
    const userToUpdate = await User.findOne({ where: { username: req.params.username } });
    if (userToUpdate) {
        userToUpdate.username = req.body.newUsername;
        await userToUpdate.save();
        res.json(userToUpdate);
    } else {
        res.status(404).end();
    }
})

module.exports = router;