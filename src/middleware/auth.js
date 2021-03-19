const jwt = require('jsonwebtoken')
const response = require('../helpers/response')
const { APP_KEY } = process.env

exports.authCheck = (req, res, next) => {
  const { authorization } = req.headers
  if (authorization && authorization.startsWith('Bearer')) {
    const token = authorization.substr(7)
    const data = jwt.verify(token, APP_KEY)
    if (data) {
      req.userData = data
      return next()
    }
  }
  return response(res, 401, false, 'Authorization needed')
}

exports.isAdmin = (req, res, next) => {
  if (req.userData.role > 1) {
    return response(res, 401, 'You are not admin!')
  } else {
    next()
  }
}
