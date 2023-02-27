const {
    getUserAuthToken,
    loginUserWithFirebase,
    signUpUserWithFirebase,
    updatePassword,
    enableFirebaseAuth,
    disableFirebaseAuth
} = require('../services/auth.service')

const {
    getUserInfoByUID,
    createNewUser,
    updateUserByUID,
} = require('../services/user.service')


/**
 * @description Login User
 * @type POST 
 * @path /api/v1/auth/login
 * @param {*} req 
 * @param {*} res 
 * @access Public
 * @returns JSON
*/
const login = async (req, res, next) => {
    if (!req.body) {
        res.status(400).send({
            success: false,
            message: "Content can not be empty!"
        });
        return;
    }
    try {
        const user = await loginUserWithFirebase(req.body.email, req.body.password)
        if (!user || user == null || user == undefined) {
            return res.status(404).send({
                success: false,
                message: "User Not Found"
            });
        }

        const userInfo = await getUserInfoByUID(user.uid)

        if (!userInfo || userInfo == null || userInfo == undefined) {
            return res.status(404).send({
                success: false,
                message: "User Not Found"
            });
        }

        const token = await getUserAuthToken()

        return res.status(200).send({
            success: true,
            user: userInfo,
            token: 'Bearer ' + token
        })
    } catch (error) {
        return res.status(404).send({
            success: false,
            message: "Error From Database: " + error
        });
    }
}


/**
 * @description Create New User
 * @type POST 
 * @path /api/v1/auth/join
 * @param {*} req 
 * @param {*} res 
 * @access Private & Super Admin
 * @returns JSON
*/
const signUp = async (req, res, next) => {
    if (!req.body) {
        return next(new ErrorResponse("Content can not be empty!", 400))
    }
    const {
        email, password, mobile, full_name
    } = req.body
    try {
        const FirebaseUserAuth = await signUpUserWithFirebase(email, password, mobile, full_name)
        const newUser = {
            uid: FirebaseUserAuth.uid,
            full_name: req.body.full_name,
            email: req.body.email,
            mobile: req.body.mobile,
            country: req.body.country,
            state: req.body.state,
            city: req.body.city,
            pincode: req.body.pincode,
            street_address: req.body.street_address,
            bio: req.body.bio,
            image: req.body.image,
            links: req.body.links,
            user_type: req.body.user_type,
        };
        if (FirebaseUserAuth.uid && FirebaseUserAuth.uid.length > 0) {
            const user = await createNewUser(newUser)

            if (user.id) {
                const userInfo = await getUserInfoByUID(FirebaseUserAuth.uid)
                console.log("userInfo", userInfo)
                return res.status(201).json({
                    success: true,
                    data: userInfo
                })
            }
        }
    } catch (error) {
        return res.status(404).send({
            success: false,
            message: error
        });
    }
}

/**
 * @description Update User Password
 * @type PUT 
 * @path /api/v1/auth/password
 * @param {*} req 
 * @param {*} res 
 * @access Private
 * @returns JSON
*/
const updateUserPassword = async (req, res, next) => {
    if (!req.body.password || !req.body.uid) {
        res.status(400).send({
            success: false,
            message: "Content can not be empty!"
        });
        return;
    }
    try {
        let UserUID = ''
        // Super Admin Check role_id==1
        if (req.userInfo.role_id === 1) {
            console.log('Super Admin Password');
            UserUID = req.body.uid
        } else {
            console.log('Auth Password');
            // If General User then user can only update the password of itself
            // Matching UID of Current User and UID from Body
            if (req?.userInfo?.uid === req.body.uid) {
                UserUID = req?.userInfo?.uid
            } else {
                return res.status(404).send({
                    success: false,
                    message: "Invalid User for the Password Reset"
                });
            }
        }

        let resp = await updatePassword(UserUID, req.body.password)

        return res.status(200).send({
            success: true,
            message: 'Password Updated Successfully'
        })

    } catch (error) {
        return res.status(404).send({
            success: false,
            message: error
        });
    }
}

/**
 * @description Disable User Account
 * @type PUT 
 * @path /api/v1/auth/disable
 * @param {*} req 
 * @param {*} res 
 * @access Super Admin
 * @returns JSON
*/
const disableUserAuth = async (req, res, next) => {
    if (!req.body.uid || !req.body.uid.length > 0) {
        return res.status(400).send({
            success: false,
            message: "User UID can not be empty!"
        });
    }
    try {
        // Disable Firebase Auth
        await disableFirebaseAuth(req.body.uid)

        // Disable User in Database 
        let resp = await updateUserByUID(req.body.uid, { disabled: 1, updated_by: req.userInfo.id })

        if (resp == 1) {
            return res.status(200).json({
                success: true,
                data: "User Account Disabled Successfully"
            })
        } else {
            return res.status(200).json({
                success: false,
                data: "User Not Found"
            })
        }

    } catch (error) {
        return res.status(404).send({
            success: false,
            message: error
        });
    }
}

/**
 * @description Enable User Account
 * @type PUT 
 * @path /api/v1/auth/disable
 * @param {*} req 
 * @param {*} res 
 * @access Super Admin
 * @returns JSON
*/
const enableUserAuth = async (req, res, next) => {
    if (!req.body.uid || !req.body.uid.length > 0) {
        return res.status(400).send({
            success: false,
            message: "User UID can not be empty!"
        });
    }
    try {
        // Enable Firebase Auth
        let resAuth = await enableFirebaseAuth(req.body.uid)

        console.log('resAuth', resAuth);

        // Enable User in Database 
        let resp = await updateUserByUID(req.body.uid, { disabled: 0, updated_by: req.userInfo.id })

        if (resp == 1) {
            return res.status(200).json({
                success: true,
                data: "User Account Enabled Successfully"
            })
        } else {
            return res.status(200).json({
                success: false,
                data: "User Not Found"
            })
        }

    } catch (error) {
        return res.status(404).send({
            success: false,
            message: error
        });
    }
}

module.exports = {
    login,
    signUp,
    updateUserPassword,
    disableUserAuth,
    enableUserAuth
}