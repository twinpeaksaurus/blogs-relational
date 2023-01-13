const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../util/db');

class Category extends Model { }
Category.init({
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name: {
        type: DataTypes.TEXT,
    }
}, {
    sequelize,
    timestamps: false,
    underscored: true,
    modelName: 'category'
})

module.exports = Category;