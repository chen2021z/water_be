const express = require("express");
const router = express.Router();
const { getAllBook, addBook, borrowOrReturn, getBorrowData, getBorrowNum } = require("../service/bookService");

router.get("/getAllBook", async (req, res, next) => {
  res.send(await getAllBook(req.query));
});
router.post("/addBook", async (req, res, next) => {
  res.send(await addBook(req.body));
});
router.post("/borrowOrReturn", async (req, res, next) => {
  res.send(await borrowOrReturn(req.body));
});
router.post("/getBorrowData", async (req, res, next) => {
  res.send(await getBorrowData(req.body));
});
router.post("/getBorrowNum", async (req, res, next) => {
  res.send(await getBorrowNum(req.body));
});

module.exports = router;
