const routes = require('express').Router()
const userController = require('../controllers/user')
const authMiddleware = require('../middleware/auth')
const validator = require('../middleware/validator')
const uploadImage = require('../middleware/uploadProfile')

routes.get('/:id', authMiddleware.authCheck, userController.getDetailUser)
routes.delete('/:id', authMiddleware.authCheck, userController.deletePicture)
routes.patch('/:id', authMiddleware.authCheck, uploadImage, validator.updateUser, validator.valdationResult, userController.UpdateUser)

module.exports = routes
