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

router.delete('/:id', async (req, res) => {
    try {
        const blog = await Blog.findByPk(req.params.id);
        if (blog) {
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
