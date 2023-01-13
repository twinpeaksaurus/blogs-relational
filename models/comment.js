const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../util/db');

class Comment extends Model { }
Comment.init({
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    author: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    content: {
        type: DataTypes.TEXT,
        allowNull: false,
    },
    created_at: {
        type: DataTypes.DATE,
    },
    updated_at: {
        type: DataTypes.DATE,
    },

}, {
    sequelize,
    timestamps: true,
    underscored: true,
    modelName: 'comment'
})

module.exports = Comment;