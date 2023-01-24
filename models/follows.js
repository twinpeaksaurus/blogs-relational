const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../util/db');

class Follows extends Model { }
Follows.init({
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    followerId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: { model: 'users', key: 'id' },
    },
    followsId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: { model: 'users', key: 'id' },
    }

}, {
    sequelize,
    timestamps: true,
    underscored: true,
    modelName: "follows"
})

module.exports = Follows;