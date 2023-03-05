const express = require("express");
const router = express.Router();

// Importing Route Module
const user = require("./modules/user.routes");
const auth = require("./modules/auth.routes");
const transaction = require("./modules/transaction.routes");

// Importing Routes
router.use("/v1/users", user);
router.use("/v1/auth", auth);
router.use("/v1/trxn", transaction);

module.exports = router;