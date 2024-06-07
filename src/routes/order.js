const express = require("express");
const router = express.Router();
const {   getAllOrder,addOrder } = require("../service/orderService");

router.get("/getAllOrder", async (req, res, next) => {
  res.send(await getAllOrder(req.query));
});
router.post("/addOrder", async (req, res, next) => {
  res.send(await addOrder(req.body));
}); 


module.exports = router;
