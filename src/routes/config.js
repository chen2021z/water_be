const express = require("express");
const router = express.Router();
const { getAllConfig, getConfig, addConfig, updateConfig, deleteConfig } = require("../service/configService");

router.get("/getAllConfig", async (req, res, next) => {
  res.send(await getAllConfig(req.query));
});
router.post("/updateConfig", async (req, res, next) => {
  res.send(await updateConfig(req.body));
});


module.exports = router;
