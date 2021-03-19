const routes = require('express').Router()
const transactionController = require('../controllers/transaction')
const authMiddleware = require('../middleware/auth')
const validator = require('../middleware/validator')

routes.post('/', authMiddleware.authCheck, validator.transaction, validator.valdationResult, transactionController.createTransaction)
routes.get('/history', authMiddleware.authCheck, transactionController.trasactionHistory)
routes.get('/:id', authMiddleware.authCheck, transactionController.detailTransaction)
routes.get('/amountTransaction/:id', authMiddleware.authCheck, transactionController.amountTransactionByUser)

module.exports = routes
