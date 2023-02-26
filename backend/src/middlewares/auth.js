const { getAuth } = require('firebase-admin/auth')
const { getUserInfoByUID } = require('../services/user.service')
const auth = getAuth()

const validateUser = async (req, res, next) => {
    // Checking Authorization Token and Starts with 'Bearer'
    if (!req.headers.authorization || !req.headers.authorization.startsWith("Bearer ")) {
        return res.status(403).json({
            error: "Unauthorized User"
        })
    }
    const token = req.headers.authorization.split(" ")[1]

    // Verify Token
    auth.verifyIdToken(token).then(decodedToken => {
        console.log('Token is correct'.blue)
        console.log('Auth Middleware Calling--->')

        // to verify the user
        auth.getUser(decodedToken.uid).then(async userRecord => {
            req.firebaseAuthUID = userRecord.uid
            // Check Role
            try{
                // Check User in the User Table by UID
                const uData = await getUserInfoByUID(userRecord.uid)
                
                // Check if user is found or Not
                if(uData===null || uData.length===0){
                    return res.status(403).json({
                        error: "Unauthorized User"
                    })
                }else{
                    // Adding New Propert UserInfo in the req Obj 
                    // We can use this UserInfo Object from any Controller 
                    console.log("User Authenticated".yellow);
                    req.userInfo = uData;
                    next()
                }
            }
            catch(e){
                return res.status(403).json({
                    error: "Unauthorized User"
                })
            }
            
        }).catch(e => {
            return res.status(403).json({
                error: "Unauthorized User"
            })
        })

    }).catch(e => {
        return res.status(403).json({
            error: "Unauthorized User"
        })
    })
}

module.exports = validateUser