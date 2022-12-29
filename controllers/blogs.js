const router = require('express').Router();

const { Blog } = require('../models');

const blogFinder = async (req, res, next) => {
    req.blog = await Blog.findByPk(req.params.id);
    next();
}


router.get('/', async (req, res) => {
    const blogs = await Blog.findAll();
    res.json(blogs);
});

router.post('/', async (req, res) => {
    try {
        const blog = await Blog.create(req.body);
        return res.json(blog);
    } catch (e) {
        return res.status(400).json(e);
    }
});

router.delete('/api/blogs/:id', async (req, res) => {
    try {
        const blog = await Blog.findByPk(req.params.id);
        if (blog) {
            console.log(blog);
            blog.destroy();
        }
    } catch (e) {
        return res.status(400).json(e);
    }
});

module.exports = router
