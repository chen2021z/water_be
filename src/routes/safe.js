const express = require('express')
const router = express.Router()
const smokeService = require('../service/smokeService')

router.post('/getSmokeData', async (req, res, next) => {
  res.send(await smokeService.getSmokeData(req.body))
})
router.post('/addSmokeData', async (req, res, next) => {
  res.send(await smokeService.addSmokeData(req.body))
})

module.exports = router
