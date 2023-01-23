const router = require('express').Router();
const { Blog, User } = require('../models');
// const { SECRET } = require('../util/config');
// const jwt = require('jsonwebtoken');
const { Op } = require('sequelize');
const { tokenExtractor } = require('../util/middleware');
const slugify = require('slugify');
const crypto = require("crypto");


/** 
 * Search query--IMPORTANT for overall organization.
 * Need pagination?
 */
router.get('/', async (req, res) => {
    let contentQuery = {}
    let searchKey = '';

    //NEED TO FIGURE OUT HOW TO FIX SO IT STILL RETURNS ALL 
    //BLOGS WHEN THERE IS NO SEARCH QUERY
    if (req.query.search) {
        searchKey = `%${req.query.search}%`
        contentQuery = {
            [Op.or]: [{
                title: {
                    [Op.iLike]: searchKey
                }
            }, {
                author: {
                    [Op.iLike]: searchKey
                }
            }]
        }
    }

    const blogs = await Blog.findAll({
        attributes: { exclude: ['userId'] },
        include: {
            model: User,
            attributes: ['name', 'username']
        },
        where: contentQuery,
        order: [
            ['likes', 'DESC']
        ]

    })
    res.json(blogs);
});

/** 
 * Route serving addition of blogs.
 * @name post/blogs
 * @function 
 * @param {string} path - express path
 * @param {callback} middleware - Express middleware
 */
router.post('/', tokenExtractor, async (req, res) => {
    try {
        const user = await User.findByPk(req.decodedToken.id)

        //get year
        const d = new Date();
        let year = d.getFullYear();

        //create slug
        var titleToSlugify = req.body.title;
        var slug = slugify(titleToSlugify, { lower: true, strict: true });

        const slugExists = (Blog.findOne({
            where: {
                slug: slug
            }
        }))

        if (slugExists) {
            var id = crypto.randomBytes(10).toString('hex');
            slug = (`${slug}-${id}`);
        }

        //will user.name work here for authorship?
        const blog = await Blog.create({
            ...req.body, userId: user.id,
            author: user.name, year: year, slug: slug
        });
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

router.put('/:id/like', tokenExtractor, async (req, res) => {
    try {
        const user = await User.findByPk(req.decodedToken.id);
        if (user) {
            const blog = await Blog.findByPk(req.params.id);
            if (blog) {
                blog.likes++;
                blog.save();
                return res.json(blog);
            }
        }
    }
    catch (e) {
        return res.status(400).json(e);
    }
})

router.put('/:id/inspiring', tokenExtractor, async (req, res) => {
    try {
        const user = await User.findByPk(req.decodedToken.id);

        if (user) {
            const blog = await Blog.findByPk(req.params.id);
            if (blog) {
                blog.inspiring++;
                blog.save();
                return res.json(blog);
            }
        }
    }
    catch (e) {
        return res.status(400).json(e);
    }
})

router.put('/:id/thoughtful', tokenExtractor, async (req, res) => {
    try {
        const user = await User.findByPk(req.decodedToken.id);

        if (user) {
            const blog = await Blog.findByPk(req.params.id);
            if (blog) {
                blog.thoughtful++;
                blog.save();
                return res.json(blog);
            }
        }
    }
    catch (e) {
        return res.status(400).json(e);
    }
})

module.exports = router
