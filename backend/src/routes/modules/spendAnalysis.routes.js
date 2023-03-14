const express = require("express");
const router = express.Router();

const AuthCheck = require('../../middlewares/Auth')

const { getTotalSpend } = require('../../controllers/transaction.controller.js')

router.get("/total", AuthCheck, getTotalSpend);

module.exports = router;