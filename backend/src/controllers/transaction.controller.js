const {
    addTransaction,
    getAllTransactions,
    getTransactionInfoByID,
    updateTransaction,
    deleteTransaction,
    total_spent
} = require('../services/transaction.service');

/**
 * @description Get All Transactions
 * @type GET
 * @path /api/v1/transactions
 * @param {*} req
 * @param {*} res
 * @access Private
 * @returns JSON
    */
const getAllTransactionsData = async (req, res, next) => {
    try {
        let user_id = req.userInfo.id
        const resp = await getAllTransactions(user_id)
        return res.status(200).json({
            success: true,
            data: resp
        })
    } catch (error) {
        console.log(error)
        return res.status(404).send({
            success: false,
            message: "Transaction Not Found"
        });
    }

}

/**
 * @description Get Transaction info by ID
 * @type GET
 * @path /api/v1/transactions/:id
 * @param {*} req
 * @param {*} res
 * @access Private
 * @returns JSON
    */
const getTransactionByID = async (req, res, next) => {
    let id = req.params.id;
    let current_user_id = req.userInfo.id
    try {
        const resp = await getTransactionInfoByID(id)
        if (resp.user_id == current_user_id) {
            return res.status(200).json({
                success: true,
                data: resp
            })
        } else {
            return res.status(404).send({
                success: false,
                message: "Transaction Not Found"
            });
        }
    } catch (error) {
        return res.status(404).send({
            success: false,
            message: "Transaction Not Found"
        });
    }
}

/**
 * @description Add Transaction
 * @type POST
 * @path /api/v1/transactions
 * @param {*} req
 * @param {*} res
 * @access Private
 * @returns JSON
 * @body {Object} transaction
    */
const save = async (req, res, next) => {
    let transaction = req.body;
    transaction.user_id = req.userInfo.id
    console.log(transaction)
    // if (transaction.type == "send") {
    //     transaction.transaction_sender = req.userInfo.id
    // } else if (transaction.type == "recieve") {
    //     transaction.transaction_receiver = req.userInfo.id
    // }
    try {
        console.log("----------adding transaction----------")
        const resp = await addTransaction(transaction)
        return res.status(200).json({
            success: true,
            data: resp
        })
    } catch (error) {
        return res.status(404).send({
            success: false,
            message: "Transaction Not Added"
        });
    }
}

/**
 * @description Update Transaction
 * @type PUT
 * @path /api/v1/transactions/:id
 * @param {*} req
 * @param {*} res
 * @access Private
 * @returns JSON
*/
const updateTransactionData = async (req, res, next) => {
    let id = req.params.id;
    let transaction = req.body;
    try {
        const resp = await updateTransaction(id, transaction)
        return res.status(200).json({
            success: true,
            data: resp
        })
    } catch (error) {
        return res.status(404).send({
            success: false,
            message: "Transaction Not Updated"
        });
    }
}

/**
 * @description Delete Transaction
 * @type DELETE
 * @path /api/v1/transactions/:id
 * @param {*} req
 * @param {*} res
 * @access Private
 * @returns JSON
 */
const deleteTransactionData = async (req, res, next) => {
    let id = req.params.id;
    try {
        const resp = await deleteTransaction(id)
        return res.status(200).json({
            success: true,
            data: resp
        })
    } catch (error) {
        return res.status(404).send({
            success: false,
            message: "Transaction Not Deleted"
        });
    }
}

const getTotalSpend = async (req, res, next) => {
    let user_id = req.userInfo.id
    try {
        const resp = await total_spent(user_id)
        // console.log(resp)
        return res.status(200).json({
            success: true,
            data: resp
        })
    } catch (error) {
        // console.log(error)
        return res.status(404).send({
            success: false,
            message: "Something went wrong"
        });
    }
}

module.exports = {
    getAllTransactionsData,
    getTransactionByID,
    save,
    updateTransactionData,
    deleteTransactionData,
    getTotalSpend
}