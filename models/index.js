const Blog = require('./blog');
const BlogContent = require('./content');
const ReadingList = require('./readingList');
const User = require('./user');
const Comment = require('./comment');

//User:blog is 1: many relationship
User.hasMany(Blog);
Blog.belongsTo(User);
Blog.sync({ alter: true });
User.sync({ alter: true });

//Blog and blog content is 1-to-1 relationship
BlogContent.belongsTo(Blog);
BlogContent.sync({ alter: true });

//User and Blog are joined by the reading_list
User.belongsToMany(Blog, { through: ReadingList, as: 'to_read' });
Blog.belongsToMany(User, { through: ReadingList });
ReadingList.sync({ alter: true });

//Each comment is connected to one blog and one user.
//Each blog has multiple comments
//Each user has multiple comments

Blog.hasMany(Comment);
Comment.belongsTo(Blog);
Comment.belongsTo(User)
Comment.sync({ alter: true });



module.exports = {
    Blog,
    User,
    ReadingList
}