const { Model, DataTypes } = require('sequelize')
const { sequelize } = require('../util/db')

class Blog extends Model { }
Blog.init({
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    author: {
        type: DataTypes.TEXT
    },
    url: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    title: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    subtitle: {
        type: DataTypes.TEXT,
        allowNull: false,
        default: "grandfathered"
    },
    likes: {
        type: DataTypes.INTEGER,
        defaultValue: 0
    },
    happy: {
        type: DataTypes.INTEGER,
        defaultValue: 0
    },
    angry: {
        type: DataTypes.INTEGER,
        defaultValue: 0
    },
    sad: {
        type: DataTypes.INTEGER,
        defaultValue: 0
    },
    created_at: {
        type: DataTypes.DATE,
    },
    updated_at: {
        type: DataTypes.DATE,
    },
    year: {
        type: DataTypes.INTEGER,
        allowNull: false
    }

}, {
    sequelize,
    timestamps: true,
    underscored: true,
    modelName: 'blog'
});

module.exports = Blog;