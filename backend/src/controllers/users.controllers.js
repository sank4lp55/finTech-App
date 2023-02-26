const {
    getAllUsers,
    getUserInfoByID,
    deleteUserByID,
    updateUserByID,
    searchUserByFullName,
    getUserInfoByUID,
} = require('../services/user.service')

const {
    deleteUserFromFirebaseAuth
} = require('../services/auth.service')


/**
 * @description Get All Users
 * @type GET 
 * @path /api/v1/users
 * @param {*} req 
 * @param {*} res 
 * @access Private
 * @returns JSON
*/
const getAllUsersData = async (req, res, next) => {
    try {
        const resp = await getAllUsers()
        return res.status(200).json({
            success: true,
            data: resp
        })
    } catch (error) {
        return res.status(404).send({
            success: false,
            message: error
        });
    }

}

/**
 * @description Get User info by ID
 * @type GET 
 * @path /api/v1/users/:id
 * @param {*} req 
 * @param {*} res 
 * @access Private
 * @returns JSON
*/
const getUserDataByID = async (req, res, next) => {
    let id = req.params.id;
    try {
        const resp = await getUserInfoByID(id)

        if (resp) {
            return res.status(200).json({
                success: true,
                data: resp
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
 * @description Update User info by ID
 * @type PUT 
 * @path /api/v1/users/:id
 * @param {*} req 
 * @param {*} res 
 * @access Private
 * @returns JSON
*/
const updateUserDataByID = async (req, res, next) => {
    let id = req.params.id;
    try {
        // Remove Properties which is not allow to user to update
        let keysToRemove = ['disabled', 'office_id', 'role_id', 'user_type', 'account_status']

        let updatedObj = await removeKeysFromObject(req.body, keysToRemove)

        // delete(req.body?.disabled)
        // delete(req.body?.office_id)
        // delete(req.body?.role_id)
        // delete(req.body?.user_type)
        // delete(req.body?.account_status)


        const resp = await updateUserByID(id, updatedObj)

        // resp return 1 if user is updated
        // resp return 0 if user is not found
        if (resp == 1) {
            return res.status(200).json({
                success: true,
                data: "User Info Updated Successfully"
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
 * @description Search User info by Query
 * @type GET 
 * @path /api/v1/users/search?text=
 * @param {*} req 
 * @param {*} res 
 * @access Private
 * @returns JSON
*/
const search = async (req, res, next) => {
    console.log('searchhhhingn');
    console.log('query: ', req.query);
    const { page, per_page, text } = req.query;
    try {
        console.log('text: ', text);
        let resp = await searchUserByFullName(text)

        return res.status(200).json({
            success: true,
            data: resp
        })

        // resp return 1 if user is updated
        // resp return 0 if user is not found
        // if (resp == 1) {
        //     return res.status(200).json({
        //         success: true,
        //         data: "User Info Updated Successfully"
        //     })
        // } else {
        //     return res.status(200).json({
        //         success: false,
        //         data: "User Not Found"
        //     })
        // }

    } catch (error) {
        return res.status(404).send({
            success: false,
            message: error
        });
    }
}

const getUserDataByUID = async (req, res, next) => {
    let uid = req.params.uid;
    try {
        const resp = await getUserInfoByUID(uid)

        if (resp) {
            return res.status(200).json({
                success: true,
                data: resp
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
 * @description Delete User info by ID
 * @type DELETE 
 * @path /api/v1/users/:id
 * @param {*} req 
 * @param {*} res 
 * @access Private
 * @returns JSON
*/
const removeUserDataByID = async (req, res, next) => {
    if (!req.params.id) {
        return res.status(400).send({
            success: false,
            message: "ID can not be empty!"
        });
    }
    let id = req.params.id;
    try {
        // Get User Info by ID
        const userData = await getUserInfoByID(id)

        // Check User
        if (userData) {
            const resp = await deleteUserByID(id)

            // resp return 1 when user found and deleted
            // resp return 0 when user not found
            if (resp == 1) {
                await deleteUserFromFirebaseAuth(userData.uid)

                return res.status(200).json({
                    success: true,
                    message: 'User Removed Successfully'
                })
            }
            if (resp == 0) {
                return res.status(200).json({
                    success: false,
                    data: "User Not Found"
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

module.exports = {
    getAllUsersData,
    getUserDataByID,
    removeUserDataByID,
    updateUserDataByID,
    getUserDataByUID,
    search
}