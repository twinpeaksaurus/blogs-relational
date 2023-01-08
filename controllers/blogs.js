const router = require('express').Router();
const { Blog, User } = require('../models');
// const { SECRET } = require('../util/config');
// const jwt = require('jsonwebtoken');
const { Op } = require('sequelize');
const { tokenExtractor } = require('../util/middleware')

// //middleware to extract token from request
// const tokenExtractor = (req, res, next) => {
//     //what does req.get do below???
//     const authorization = req.get('authorization');
//     if (authorization && authorization.toLowerCase().startsWith('bearer ')) {
//         try {
//             req.decodedToken = jwt.verify(authorization.substring(7), SECRET);
//         } catch {
//             return res.status(401).json({ error: 'token invalid' });
//         }
//     } else {
//         console.log(authorization);

//         return res.status(401).json({ error: 'token missing' });
//     }
//     next();
// }

//middleware to identify blog
// const blogFinder = async (req, res, next) => {
//     req.blog = await Blog.findByPk(req.params.id);
//     next();
// }


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


        //will user.name work here for authorship?
        const blog = await Blog.create({
            ...req.body, userId: user.id,
            author: user.name, year: year
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
