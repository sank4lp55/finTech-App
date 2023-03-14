const express = require("express");
const router = express.Router();

const AuthCheck = require('../../middlewares/Auth')

const { getAllTransactionsData, getTransactionByID, save, updateTransactionData, deleteTransactionData, getTotalSpend } = require('../../controllers/transaction.controller.js')

router.get("/", AuthCheck, getAllTransactionsData);
router.get("/:id", AuthCheck, getTransactionByID);
router.post("/", AuthCheck, save);
router.put("/:id", AuthCheck, updateTransactionData);
router.delete("/:id", AuthCheck, deleteTransactionData);

module.exports = router;