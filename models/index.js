const Blog = require('./blog');
const User = require('./user');

User.hasMany(Note);
Note.belongsTo(User);
Blog.sync({alter: true});
User.sync({alter: true});

module.exports = {
    Blog,
    User
}