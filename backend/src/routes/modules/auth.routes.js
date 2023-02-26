const express = require("express");
const router = express.Router();

const AuthCheck = require('../../middlewares/Auth')
const saAuthCheck = require('../../middlewares/saAuth')

// Importing Auth Controller
const { 
    login, 
    signUp, 
    updateUserPassword, 
    disableUserAuth, 
    enableUserAuth 
} = require('../../controllers/auth.controller')

// Importing Auth Route
// Base URL: /api/v1/auth/
router.post("/login", login);
router.post("/signup", signUp);
router.put("/password", AuthCheck, updateUserPassword);
router.put("/disable", saAuthCheck, disableUserAuth);
router.put("/enable", saAuthCheck, enableUserAuth);

module.exports = router;