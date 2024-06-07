const Sql = require('../db/sql');
const { toTree } = require('../utils/changeData');
const { SuccessModel, ErrorModel } = require('../utils/resModel')
const dayjs = require('dayjs')

const getAllOrder = async (data) => {
  const sql = new Sql({_table: 'order'});
  const limit = data.limit ? data.limit : 100;
  data.current ? data.current : data.current = 1
  let condition = data.beforeTime && data.endTime ? `stime > '${ data.beforeTime }' and stime <= '${ data.endTime }'` : ``
  data.device_id ? condition += `and device_id = ${data.device_id} ` : ''
  data.student_id ? condition += `and student_id = ${data.student_id} ` : ''
  if(condition.slice(0,3) == 'and'){
    condition = condition.slice(3)
  }
  return await sql.select().where(condition)
    .orderBy('stime', 'DESC').limit([(data.current -1) * limit, limit]).run()
    .then(async res => {
      // console.log(res);
      const totalSql = new Sql({_table: 'order'})
      let result = {}
      result.records = res
      await totalSql.select('count(*) as total').where(data.beforeTime && data.endTime ? `stime > '${ data.beforeTime }' and stime <= '${ data.endTime }'` : ``)
        .run().then(item => {
          // console.log(item);
          result.total = item[0].total
        })
      return new SuccessModel(result)
    })
    .catch(err => new ErrorModel({code: err.errno, message: err.sqlMessage}))
}


const addOrder = async (data) => {
  // data.ctime = dayjs().format('YYYY-MM-DD HH:mm:ss')
  // console.log(data);
  const sql = new Sql({_table: 'order'})
  return await sql.insert(data).run().then(res => {
    return new SuccessModel(res)})
    .catch(err => new ErrorModel({code: err.errno, message: err.sqlMessage}))
}


const borrowOrReturn = async (data, type) => {
  data.ctime = dayjs().format('YYYY-MM-DD HH:mm:ss')
  // type 1借  2还
  if(type){
    data.borrow_return = type
  }
  // console.log(data);
  const sql = new Sql({_table: 'book_record'})
  return await sql.insert(data).run().then(async res => {
    // 默认1图书在库 0不在库
    let bookStatus = 1
    if(data.borrow_return == 1){
      bookStatus = 0
    }
    return await updateBookStatus(bookStatus,data.book_id)
    
    
  })
    .catch(err => new ErrorModel({code: err.errno, message: err.sqlMessage}))
}

/**
 * , 
 * @param {*} data {status:0/1}
 * @param {*} bookId 
 */
const updateBookStatus = async (status, bookId) => {
  const data = {status}
  const sql = new Sql({_table: 'book_data'})
  return await sql.update(data, bookId).run().then(res => new SuccessModel(res))
  .catch(err => new ErrorModel({code: err.errno, message: err.sqlMessage}))
}
const getBorrowData = async (data) => {
  const deviceSql = `select book_record.*, book_data.book_name from book_record left join book_data  on book_record.book_id = book_data.id ${data.beforeTime && data.endTime ? `where book_record.ctime > '${data.beforeTime}' and book_record.ctime < '${data.endTime}'` : ""} order by book_record.ctime desc`
  const sql = new Sql({ sql: deviceSql })
  // @ts-ignore
  return await sql
  .run()
    .then(res => {
      // console.log(res);
      return new SuccessModel(res)
    })
    .catch(err => new ErrorModel({code: err.errno, message: err.sqlMessage}))
}
// 统计图书借阅次数
const getBorrowNum = async (data) => {
  const deviceSql = `select book_record.*, book_data.book_name from book_record left join book_data  on book_record.book_id = book_data.id order by book_record.ctime desc`
  const sql = new Sql({ sql: deviceSql })
  // @ts-ignore
  return await sql.run()
    .then(res => {
      console.log(res);
      let resData = {
        list: toTree({
          data: res,
          key: 'book_id',
          objKey:['book_id','book_name'],
          listKey: ['id', 'person_id', 'ctime', 'borrow_return']
        })
      }
      // console.log(resData);

      return new SuccessModel(resData)
    })
    .catch(err => new ErrorModel({code: err.errno, message: err.sqlMessage}))
}



module.exports = {
  getAllOrder,
  addOrder
}