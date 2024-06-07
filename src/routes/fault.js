const express = require('express')
const router = express.Router()
const faultService = require('../service/faultService')
const dayis = require('dayjs')

router.post('/getAllFault', async (req, res, next) => {
  res.send(await faultService.getAllFault(req.body))
})

router.post('/addFault', async (req, res, next) => {
  res.send(await faultService.addFault(req.body))
})

module.exports = router
