const { getAuth } = require('firebase-admin/auth')
const { signInWithEmailAndPassword } = require("firebase/auth");
const authClient = require('../config/firebase')

const auth = getAuth()

/**
 * @description User Login Service
 * @param {String} email - User Email ID
 * @param {String} password - User Password
 * @returns {Object} User Object
*/
const loginUserWithFirebase = async (email, password) => {
    const res = await signInWithEmailAndPassword(authClient, email, password)
    return res.user
}

/**
 * @description Get User Auth Token Service
 * @returns {Object} User Token
*/
const getUserAuthToken = async () => {
    let token = await authClient.currentUser.getIdToken(/* forceRefresh */ true)
    return token
}

/**
 * @description Sign Up User Service
 * @param {String} email - email
 * @param {String} password - password
 * @param {String} mobile - mobile number
 * @param {String} full_name - full name
 * @returns {Object} User Object
*/
const signUpUserWithFirebase = async (email, password, mobile, full_name) => {
    const res = await auth.createUser({
        email: email,
        password: password || "123456789",
        emailVerified: false,
        phoneNumber: '+91' + mobile,
        displayName: full_name,
        photoURL: 'https://picsum.photos/200/300',
        disabled: false
    })
    return res
}

/**
 * @description Update Password Service
 * @param {String} uid - Firebase Auth UID
 * @param {String} password - New Password
 * @returns {Object} User Object
*/
const updatePassword = async (uid, password) => {
    const res = await auth.updateUser(uid, {password: password})
    return res
}

/**
 * @description Delete User Auth Service
 * @param {String} uid - Firebase Auth UID
 * @returns {Object} User Object
*/
const deleteUserFromFirebaseAuth = async (uid) => {
    const res = await auth.deleteUser(uid)
    return res
}

/**
 * @description Update Firebase Auth User Service
 * @param {String} uid - Firebase Auth UID
 * @param {Object} data - New Password
 * @returns {Object} User Object
*/
const updateFirebaseAuthUserByUID = async (uid, data) => {
    const res = await auth.updateUser(uid, data)
    return res
}

/**
 * @description Enable Firebase Auth for User Service
 * @param {String} uid - Firebase Auth UID
 * @returns {Object} User Object
*/
const enableFirebaseAuth = async (uid) => {
    const res = await auth.updateUser(uid, {disabled: false})
    return res
}

/**
 * @description Disable Firebase Auth for User Service
 * @param {String} uid - Firebase Auth UID
 * @returns {Object} User Object
*/
const disableFirebaseAuth = async (uid) => {
    const res = await auth.updateUser(uid, {disabled: true})
    return res
}

module.exports = {
    loginUserWithFirebase,
    getUserAuthToken,
    signUpUserWithFirebase,
    updatePassword,
    deleteUserFromFirebaseAuth,
    updateFirebaseAuthUserByUID,
    enableFirebaseAuth,
    disableFirebaseAuth
}
