'use strict';
module.exports = (sequelize, DataTypes) => {
    const user = sequelize.define('user', {
        uid: {
            type: DataTypes.STRING(100),
            allowNull: false,
        },
        full_name: {
            type: DataTypes.STRING(100),
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Please enter your full name'
                }
            }
        },
        email: {
            type: DataTypes.STRING(100),
            unique: true,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Please enter your email'
                }
            }
        },
        mobile: {
            type: DataTypes.STRING(15),
            unique: true,
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Please enter your mobile number'
                }
            }
        },
        country: {
            type: DataTypes.STRING(50),
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Please enter your country name'
                }
            }
        },
        state: {
            type: DataTypes.STRING(100),
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Please enter your state name'
                }
            }
        },
        city: {
            type: DataTypes.STRING(50),
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Please enter your city name'
                }
            }
        },
        pincode: {
            type: DataTypes.STRING(15),
            allowNull: false,
            validate: {
                notNull: {
                    msg: 'Please enter your pincode number'
                }
            }
        },
        street_address: {
            type: DataTypes.STRING(200),
        },
        bio: {
            type: DataTypes.TEXT,
        },
        image: {
            type: DataTypes.STRING(255),
        },
        links: {
            type: DataTypes.JSON,
            allowNull: false,
            defaultValue: { "linkedIn": "", "twitter": "", "instagram": "", "facebook": "", "website": "" }
        },
        account_status: {
            type: DataTypes.SMALLINT,
            allowNull: false,
            defaultValue: 1,
        },
        user_type: {
            type: DataTypes.SMALLINT,
            allowNull: false,
            defaultValue: 1,
        }
    },
        {
            indexes: [
                {
                    name: "email_index",
                    using: 'BTREE',
                    unique: true,
                    fields: ['email']
                }
            ]
        },
        {
            tableName: "users"
        },);
    // user.associate = function (models) {

    // };
    return user;
};