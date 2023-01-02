const router = require('express').Router();
const { Blog, User } = require('../models');
const { SECRET } = require('../util/config');
const jwt = require('jsonwebtoken');
const { Op } = require('sequelize');

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

//middleware to identify blog
// const blogFinder = async (req, res, next) => {
//     req.blog = await Blog.findByPk(req.params.id);
//     next();
// }


router.get('/', async (req, res) => {
    const where = {}


    //how can I make this case-insensitive using LIKE?
    if (req.query.search) {
        const searchKey = `%${req.query.search}%`
        where.title = {
            [Op.iLike]: searchKey
        }
    }


    const blogs = await Blog.findAll({
        attributes: { exclude: ['userId'] },
        include: {
            model: User,
            attributes: ['name', 'username']
        },
        where

    })
    res.json(blogs);
});

router.post('/', tokenExtractor, async (req, res) => {
    try {
        const user = await User.findByPk(req.decodedToken.id)

        //will user.name work here for authorship?
        const blog = await Blog.create({ ...req.body, userId: user.id, author: user.name });
        return res.json(blog);
    } catch (e) {
        return res.status(400).json(e);
    }
});

router.delete('/:id', tokenExtractor, async (req, res) => {
    try {
        const user = await User.findByPk(req.decodedToken.id);

        const blog = await Blog.findByPk(req.params.id);
        if (blog && blog.userId == user.id) {
            console.log(blog);
            blog.destroy();
            return res.status(200);
        }
    } catch (e) {
        return res.status(204).json(e);
    }
});

router.put('/:id', async (req, res) => {
    try {
        const blog = await Blog.findByPk(req.params.id);
        if (blog) {
            blog.likes = req.body.likes;
            blog.save();
            return res.json(blog);
        }
    }
    catch (e) {
        return res.status(400).json(e);
    }
})

module.exports = router
