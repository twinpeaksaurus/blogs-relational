const router = require('express').Router();
const { User } = require('../models');
const { Blog } = require('../models');
const { Op } = require('sequelize');
const { tokenExtractor } = require('../util/middleware');
const Follows = require('../models/follows');

router.post('/', async (req, res) => {
    try {
        const user = await User.create(req.body);
        return res.json(user);
    } catch (e) {
        return res.status(400).json(e)
    }
});

router.get('/', async (req, res) => {
    const users = await User.findAll({
        include: {
            model: Blog
        }
    });
    res.json(users);
});

router.get('/:id', async (req, res) => {

    let read = {
        [Op.in]: [true, false]
    }

    if (req.query.read) {
        read = req.query.read === "true";
    }
    const user = await User.findByPk(req.params.id, {
        include: [
            {
                model: Blog,
                as: 'to_read',
                attributes: {
                    exclude: ['createdAt', 'updatedAt',
                        'userId']
                },
                through: {
                    attributes: ['read', 'read_at', 'id'],
                    where: {
                        read
                    }
                }
            }
        ]
    });
    res.json(user);
})

router.put('/:username', async (req, res) => {
    const userToUpdate = await User.findOne({ where: { username: req.params.username } });
    if (userToUpdate) {
        userToUpdate.username = req.body.newUsername;
        // userToUpdate.updated = new Date();
        await userToUpdate.save();
        res.json(userToUpdate);
    } else {
        res.status(404).end();
    }
})

// router.post('/follow', tokenExtractor, async (req, res) => {

//     try {
//         const user = await User.findByPk(req.decodedToken.id);
//         console.log(user.id);

//         const userToFollow = await User.findByPk(req.body.follow);
//         console.log(userToFollow);

//         const follow = await Follows.create({
//             followerId: user.id,
//             followsId: userToFollow.id
//         });
//         return res.json(follow);
//     } catch (e) {
//         return res.status(400).json(e);
//     }

// })

module.exports = router;