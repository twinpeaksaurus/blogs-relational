const router = require('express').Router();
const { Blog, User, ReadingList } = require('../models');
const { tokenExtractor } = require('../util/middleware')

router.post('/', tokenExtractor, async (req, res) => {
    try {
        const user = await User.findByPk(req.decodedToken.id)
        console.log(user.id);
        const blog = await Blog.findByPk(req.body.blogId);
        console.log(blog.id);
        const userIdToAdd = user.id;
        const blogIdToAdd = blog.id;

        const readingList = await ReadingList.create({
            ...req.body, userId: userIdToAdd,
            blogId: blogIdToAdd,
            created_at: new Date()
        })
        return res.json(readingList);
    } catch (e) {
        return res.status(400).json(e);
    }
});


module.exports = router;