const express = require("express");
const router = express.Router();
const { getAllDeviceInfo, addDeviceInfo, getDeviceStatus,getAllDeviceStatus,updateDeviceStatus } = require("../service/deviceService");

router.get("/getAllDeviceInfo", async (req, res, next) => {
  res.send(await getAllDeviceInfo(req.query));
});
router.get("/getAllDeviceStatus", async (req, res, next) => {
  res.send(await getAllDeviceStatus(req.query));
}); 
router.post("/updateDeviceStatus", async (req, res, next) => {
  res.send(await updateDeviceStatus(req.body));
}); 
// router.post("/borrowOrReturn", async (req, res, next) => {
//   res.send(await borrowOrReturn(req.body));
// });
// router.post("/getBorrowData", async (req, res, next) => {
//   res.send(await getBorrowData(req.body));
// });
// router.post("/getBorrowNum", async (req, res, next) => {
//   res.send(await getBorrowNum(req.body));
// });

module.exports = router;
