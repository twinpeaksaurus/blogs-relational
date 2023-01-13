const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../util/db');

class BlogContent extends Model { }
BlogContent.init({
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    content: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    image: {
        type: DataTypes.TEXT
    }
}, {
    sequelize,
    timestamps: true,
    underscored: true,
    modelName: 'blog_content'
});

module.exports = BlogContent;