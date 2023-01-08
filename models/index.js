const Blog = require('./blog');
const ReadingList = require('./readingList');
const User = require('./user');

User.hasMany(Blog);
Blog.belongsTo(User);
Blog.sync({ alter: true });
User.sync({ alter: true });

User.belongsToMany(Blog, { through: ReadingList, as: 'to_read' });
Blog.belongsToMany(User, { through: ReadingList });
ReadingList.sync({ alter: true });

module.exports = {
    Blog,
    User,
    ReadingList
}