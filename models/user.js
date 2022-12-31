const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../util/db');

class User extends Model { }
User.init({
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    username: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true,
        validate: {
            isEmail: {
                args: true,
                msg: "Your username must be an email address."
            }
        },
    }
}, {
    sequelize,
    underscored: true,
    timestamps: true,
    modelName: 'user'
});

module.exports = User;