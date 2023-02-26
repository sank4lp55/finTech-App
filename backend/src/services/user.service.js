const { user, Sequelize } = require("../models");
const Op = Sequelize.Op;

/**
 * @description Get User info By UID from Database Service
 * @param {String} uid - Firebase Auth UID
 * @returns {Object} User Object
 */
const getUserInfoByUID = async (uid) => {
  let res = await user.findOne({
    where: {
      'uid': uid
    },
  })
  return res
};

/**
 * @description Check the User is Super Admin of Not
 * @param {String} uid - Firebase Auth UID
 * @returns {Object} User Object
 */
const checkSuperAdminByUID = async (uid) => {
  const res = await user.findOne({
    where: {
      'uid': uid,
      'role_id': 1

    }
  })
  return res
};


/**
 * @description Create New User in Users table Service
 * @param {String} email - email
 * @param {String} mobile - mobile number
 * @param {String} full_name - full name
 * @param {String} designation - designation
 * @param {Number} office_id - office_id
 * @param {Number} role_id - role_id
 * @param {String} bio - bio
 * @param {String} street_address - street_address
 * @param {String} city - city
 * @param {String} state - state
 * @param {String} country - country
 * @param {String} pincode - pincode
 * @param {String} image - image
 * @param {Object} links - links { linkedin, twitter, instagram, facebook, github, website }
 * @param {String} nickname - nickname
 * @param {Number} disabled - disabled
 * @param {Number} user_type - user_type
 * @param {Number} account_status - account_status
 * @param {String} uid - uid
 * @returns {Object} User Object
 */
const createNewUser = async (newUserData) => {
  let res = await user.create(newUserData);
  return res;
};

/**
 * @description Get all Users from Database Service
 * @returns {Object} User Object
 */
const getAllUsers = async (column_sort, order_by) => {
  let res = await user.findAll({
    order: [
      [column_sort, order_by]
    ],
  });
  return res
}
// const getAllUsers = async () => {
//   const res = await db(dbTables.users)
//     .select(
//       `${dbTables.users}.*`,
//       `${dbTables.offices}.name as office`,
//       `${dbTables.offices}.id as office_id`,)
//     .innerJoin(
//       `${dbTables.offices}`,
//       `${dbTables.users}.office_id`,
//       `${dbTables.offices}.id`
//     );
//   var result = [];
//   res.forEach((user) => {
//     let office = {
//       id: res[0].office_id,
//       name: res[0].office,
//     };

//     result.push(
//       makeObject(user, office, "office"),
//     )
//   });
//   return result;
// };

/**
 * @description Get User info By ID from Database Service
 * @param {String} id - id
 * @returns {Object} User Object
 */
const getUserInfoByID = async (id) => {
  // const res = await db(dbTables.users).select('*').where('id', id)

  const res = await user.findOne({
    where: {
      'id': id
    },
  })
  return res
};

/**
 * @description Delete User By ID from Database Service
 * @param {String} id - id
 * @returns {Object} User Object
 */
const deleteUserByID = async (id) => {
  let res = await user.destroy({
    where: {
      id: id
    }
  });
  return res
};

/**
 * @description Update User By ID from Database Service
 * @param {Object} data - Updated Data
 * @param {Number} id - id
 * @returns {Object} User Object
 */
const updateUserByID = async (id, data) => {
  let res = await user.update(data, {
    where: {
      'id': id
    }
  });
  return res
};

/**
 * @description Update User By UID from Database Service
 * @param {Object} data - Updated Data
 * @param {Number} uid -  firebase auth uid
 * @returns {Object} User Object
 */
const updateUserByUID = async (uid, data) => {
  let res = await user.update(data, {
    where: {
      'uid': uid
    }
  });
  return res
};


/**
 * @description Search User by Full Name  Database Service
 * @param {String} text - text to search
 * @returns {Object} User Object
*/
const searchUserByFullName = async (limit, offset, text) => {
  console.log("limit, offset,text", limit, offset, text)
  let res = await user.findAndCountAll({
    where: {
      [Op.or]: {
        full_name: {
          [Op.like]: "%" + text + "%"
        },
        nickname: {
          [Op.like]: "%" + text + "%"
        },
      }
    },
    limit,
    offset
  });
  return res
};

module.exports = {
  getUserInfoByUID,
  createNewUser,
  getAllUsers,
  checkSuperAdminByUID,
  getUserInfoByID,
  deleteUserByID,
  updateUserByID,
  updateUserByUID,
  searchUserByFullName
}
