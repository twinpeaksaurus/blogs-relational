const { DataTypes } = require('sequelize')

module.exports = {
    up: async ({ context: queryInterface }) => {
        await queryInterface.createTable('reading_lists', {
            id: {
                type: DataTypes.INTEGER,
                primaryKey: true,
                autoIncrement: true
            },
            userId: {
                type: DataTypes.INTEGER,
                allowNull: false,
                references: { model: 'users', key: 'id' }
            },
            blogId: {
                type: DataTypes.INTEGER,
                allowNull: false,
                references: { model: 'blogs', key: 'id' }
            },
            read: {
                type: DataTypes.BOOLEAN,
                defaultValue: false
            },
            created_at: {
                type: DataTypes.DATE,
                defaultValue: new Date()

            },
            updated_at: {
                type: DataTypes.DATE,
                defaultValue: new Date()
            },
            read_at: {
                type: DataTypes.DATE,
                defaultValue: null
            }
        },
            {
                timestamps: false,
                underscored: true
            })
    },
    down: async ({ context: queryInterface }) => {
        await queryInterface.dropTable('reading_lists');
    }
}