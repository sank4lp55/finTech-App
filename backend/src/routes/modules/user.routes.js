const express = require("express");
const router = express.Router();
const saAuthCheck = require('../../middlewares/saAuth')
const AuthCheck = require('../../middlewares/Auth')

// Importing User Controller
const {
    getAllUsersData,
    getUserDataByID,
    removeUserDataByID,
    updateUserDataByID,
    getUserDataByUID,
    search, sendUserData
} = require('../../controllers/users.controllers')

// Importing Users Route
// Base URL: /api/v1/users/
router.get("/", AuthCheck, getAllUsersData);
router.get("/search", AuthCheck, search);
// router.get("/:id", AuthCheck, getUserDataByID);
router.get("/uid/:uid", AuthCheck, getUserDataByUID);
router.get("/me", AuthCheck, sendUserData)
router.put("/:id", AuthCheck, updateUserDataByID);
router.delete("/:id", saAuthCheck, removeUserDataByID);

module.exports = router;