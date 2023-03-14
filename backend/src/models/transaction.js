
'use strict';
module.exports = (sequelize, DataTypes) => {
    const transaction = sequelize.define('transaction', {
        type: {
            type: DataTypes.STRING(100),
            allowNull: false,
        },
        amount: {
            type: DataTypes.STRING(100),
            allowNull: false,
        },
        refNo: {
            type: DataTypes.STRING(100),
            allowNull: false,
            unique: true,
            validate: {
                notNull: {
                    msg: 'Reference Number is required'
                }
            }
        },
        user_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        date: {
            type: DataTypes.DATE,
            defaultValue: DataTypes.NOW,
            allowNull: false,
        },
        status: {
            type: DataTypes.STRING(100),
            allowNull: false,
        },
        description: {
            type: DataTypes.STRING(100),
            allowNull: false,
        },
        category: {
            type: DataTypes.STRING(100),
            allowNull: false,
        },
        // transaction_sender: {
        //     type: DataTypes.SMALLINT,
        //     allowNull: false,
        // },
        // transaction_receiver: {
        //     type: DataTypes.SMALLINT,
        //     allowNull: false,
        // },

    }, {});
    transaction.associate = function (models) {
        // associations can be defined here
        transaction.belongsTo(models.user, {
            foreignKey: 'user_id',
            as: 'user'
        });
    };
    return transaction;
};
