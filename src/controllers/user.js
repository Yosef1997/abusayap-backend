const userModel = require('../models/users')
const response = require('../helpers/response')
const bcrypt = require('bcrypt')
const fs = require('fs')

exports.getDetailUser = async (req, res) => {
  try {
    const { id } = req.params

    const results = await userModel.getUsersByCondition({ id })
    console.log(results)
    if (results.length === 1) {
      return response(res, 200, true, `Detail's ${results[0].firstName}`, results[0])
    }
    return response(res, 404, false, 'Cant Found Detail User')
  } catch (err) {
    return response(res, 400, false, 'Bad Request')
  }
}

exports.UpdateUser = async (req, res) => {
  try {
    const { id } = req.params
    const {
      pin,
      newPassword,
      password,
      phoneNumber,
      ...data
    } = req.body
    const salt = await bcrypt.genSalt()

    const initialResults = await userModel.getUsersByCondition({ id })
    if (initialResults.length < 1) {
      return response(res, 404, false, 'User Not Found')
    }

    // if (initialResults[0].pin === null) {
    //   return response(res, 404, false, 'Your account does not have a PIN, please create PIN first')
    // }

    // PIN
    if (pin) {
      const encryptedPin = await bcrypt.hash(pin, salt)
      const pinResults = await userModel.updateUser(id, { pin: encryptedPin })
      if (pinResults.affectedRows > 0) {
        if (initialResults[0].pin === null) {
          return response(res, 200, true, 'PINS have been created', { ...initialResults[0], pin: encryptedPin })
        }
        return response(res, 200, true, 'PINS have been updated', { id: initialResults[0].id, pin: encryptedPin })
      }
      return response(res, 400, false, 'Failed update pin')
    }

    // Password
    if (password) {
      const compare = bcrypt.compareSync(password, initialResults[0].password)
      if (compare) {
        const encryptedNewPassword = await bcrypt.hash(newPassword, salt)
        const passwordResult = await userModel.updateUser(id, { password: encryptedNewPassword })
        if (passwordResult.affectedRows > 0) {
          return response(res, 200, true, 'Password have been updated', { id: initialResults[0].id })
        }
        return response(res, 400, false, 'Password cant update')
      }
      return response(res, 401, false, 'Wrong current password')
    }

    // phone
    if (phoneNumber) {
      if (phoneNumber === initialResults[0].phoneNumber) {
        const deletePhoneNumber = await userModel.updateUser(id, { phoneNumber: null })
        if (deletePhoneNumber.affectedRows > 0) {
          return response(res, 200, true, 'Phone number has been deleted', { phoneNumber: null })
        }
        return response(res, 400, false, 'Cant delete phone number')
      } else {
        const updatePhoneNumber = await userModel.updateUser(id, { phoneNumber: phoneNumber })
        if (updatePhoneNumber.affectedRows > 0) {
          return response(res, 200, true, 'Phone number hasbeen updated', { id, phoneNumber })
        }
        return response(res, 400, false, 'Cant update phone number1')
      }
    }

    // image
    if (req.file) {
      // const updatePicture = await userModel.updateUser(id, {picture: req.file.path})
      const picture = req.file.filename
      const uploadImage = await userModel.updateUser(id, { picture })
      if (uploadImage.affectedRows > 0) {
        if (initialResults[0].picture !== null) {
          fs.unlinkSync(`upload/profile/${initialResults[0].picture}`)
        }
        return response(res, 200, true, 'Image hash been Updated', { id, picture })
      }
      return response(res, 400, false, 'Cant update image')
    }

    // info
    const finalResult = await userModel.updateUser(id, data)
    if (finalResult.affectedRows > 0) {
      return response(res, 200, true, 'Personal Information has been updated', { ...initialResults[0], ...data })
    }
    return response(res, 400, false, 'Cant Update personal Information')
  } catch (err) {
    console.log(err)
    return response(res, 400, false, 'Bad Request')
  }
}

exports.deletePicture = async (req, res) => {
  try {
    const { id } = req.params
    console.log(id)
    const initialResults = await userModel.getUsersByCondition({ id })
    if (initialResults.length < 1) {
      return response(res, 404, false, 'User Not Found')
    }
    if (initialResults[0].picture === null) {
      return response(res, 400, false, 'Your are not using profile picture')
    }
    const uploadImage = await userModel.deletePicture(id)
    if (uploadImage.affectedRows > 0) {
      if (initialResults[0].picture !== null) {
        fs.unlinkSync(`upload/profile/${initialResults[0].picture}`)
      }
      return response(res, 200, true, 'Delete picture profile successfully', { id, picture: null })
    }
    return response(res, 400, false, 'Cant Delete Profile')
  } catch (err) {
    console.log(err)
    return response(res, 400, false, 'Bad Request')
  }
}
