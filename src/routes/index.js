const express = require('express')
const router = express.Router()

// router.use('/setting', require('./setting'))
router.use('/device', require('./device'))
router.use('/config', require('./config'))
router.use('/order', require('./order'))
router.use('/publish', require('./publish'))
router.use('/fault', require('./fault'))
// router.use('/safe', require('./safe'))
// router.use('/book', require('./book'))

module.exports = router
