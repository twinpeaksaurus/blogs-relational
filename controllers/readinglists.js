const router = require('express').Router();
const { Blog, User, ReadingList } = require('../models');
const { tokenExtractor } = require('../util/middleware')

/**
 * Adds a blog to the reading list of the user requesting
 * defaulted to unread.
 * 
 * THOUGHTS: Can there be WANT TO READ v. READ?
 */
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

/** 
 * Changes blog between read and unread.
 */
router.put('/:id', tokenExtractor, async (req, res) => {
    try {
        const user = await User.findByPk(req.decodedToken.id)
        const entry = await ReadingList.findByPk(req.params.id);

        console.log(`user id, ${user.id}`);

        //THESE ARE ENDING UP UNDEFINED
        console.log(`reading list id: ${entry.id}`)
        console.log(`reading list user id: ${entry.userId}`)

        if (entry.userId == user.id) {
            entry.read = !(entry.read);
            if (entry.read == true) { entry.read_at = new Date(); }
            else { entry.read_at = null; }

            await entry.save();
            res.json(entry);
        }
        else {
            return res.status(400);
        }

    } catch (e) {
        return res.status(400).json(e);
    }
})


module.exports = router;