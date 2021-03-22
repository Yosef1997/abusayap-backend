const routes = require('express').Router()
const topUpController = require('../controllers/topUp')
const authMiddleware = require('../middleware/auth')
const validator = require('../middleware/validator')
const uploadTransfer = require('../middleware/uploadTransfer')

routes.get('', authMiddleware.authCheck, topUpController.getAllTopUp)
routes.post('', authMiddleware.authCheck, uploadTransfer, validator.topUp, validator.valdationResult, topUpController.createdTopUp)
routes.patch('/:id', authMiddleware.authCheck, authMiddleware.isAdmin, validator.topUpUpdate, validator.valdationResult, topUpController.updateTopUp)

module.exports = routes
