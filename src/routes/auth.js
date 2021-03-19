const routes = require('express').Router()
const authController = require('../controllers/auth')

routes.post('/sign-up', authController.signUp)
routes.post('/login', authController.login)
routes.patch('/pin/:id', authController.createPin)
routes.post('/forgotPassword', authController.forgotPassword)
routes.get('/verification/:id', authController.verificationEmail)
routes.patch('/resetPassword/:token', authController.resetPassword)

module.exports = routes
