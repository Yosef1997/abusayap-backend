const routes = require('express').Router()
const chartController = require('../controllers/chart')
const authMiddleware = require('../middleware/auth')

routes.get('', authMiddleware.authCheck, chartController.getStatisticTransacttion)

module.exports = routes
