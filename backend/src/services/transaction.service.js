const { transaction, Sequelize } = require('../models');
const { user } = require('../models');
const Op = Sequelize.Op;

/**
 * @description Get Transaction info By ID from Database Service
 * @param {String} id - id
 * @returns {Object} Transaction Object
*/
const getTransactionInfoByID = async (id) => {
    let res = await transaction.findOne({
        where: {
            'id': id
        },
        include: [{
            model: user,
            as: 'user'
        }]
    })
    return res
};

/**
 * @description Get All Transactions from Database Service
 * @returns {Object} Transaction Object
*/
const getAllTransactions = async (user_id) => {
    let res = await transaction.findAll({
        where: {
            'user_id': user_id
        },
        include: [{
            model: user,
            as: 'user'
        }]
    })
    return res
}

/**
 * @description Add Transaction to Database Service
 * @param {Object} transaction - transaction
 * @returns {Object} Transaction Object
*/
const addTransaction = async (trxnData) => {
    let res = await transaction.create(trxnData)
    return res
}

/**
 *  @description Delete Transaction from Database Service
 * @param {String} id - id
 * @returns {Object} Transaction Object
 */
const deleteTransaction = async (id) => {
    let res = await transaction.destroy({
        where: {
            id: id
        }
    });
    return res
}

/**
 * @description Update Transaction in Database Service
 * @param {String} id - id
 * @param {Object} transaction - transaction
 * @returns {Object} Transaction Object
 */
const updateTransaction = async (id, transaction) => {
    let res = await transaction.update(transaction, {
        where: {
            id: id
        }
    });
    return res
}

const total_spent = async (user_id) => {
    let res = await transaction.findAll({
        where: {
            'user_id': user_id
        }
    })

    let total = 0
    for (let i = 0; i < res.length; i++) {
        total += Number(res[i].amount)
    }
    return total
}


module.exports = {
    getTransactionInfoByID,
    getAllTransactions,
    addTransaction,
    deleteTransaction,
    updateTransaction,
    total_spent
}
