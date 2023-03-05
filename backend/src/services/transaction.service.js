const { transaction, Sequelize } = require('../models');

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
    })
    return res
};

/**
 * @description Get All Transactions from Database Service
 * @returns {Object} Transaction Object
*/
const getAllTransactions = async () => {
    let res = await transaction.findAll({
        where: {
            'id': {
                [Op.gt]: 0
            }
        },
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


module.exports = {
    getTransactionInfoByID,
    getAllTransactions,
    addTransaction,
    deleteTransaction,
    updateTransaction
}
