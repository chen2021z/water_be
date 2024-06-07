const express = require('express')
const router = express.Router()
const publishService = require('../service/publishService')

router.post('/publish', async (req, res, next) => {
  res.send(await publishService.publish(req.body))
})

router.post('/sendMqtt', async (req, res, next) => {
  res.send(await publishService.sendMqtt(req.body))
})

module.exports = router
