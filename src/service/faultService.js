const Sql = require('../db/sql')
const { SuccessModel, ErrorModel } = require('../utils/resModel')
const dayjs = require('dayjs')


const getAllFault = async (data) => {
  const sql = new Sql({_table: 'error'})
  const limit = data.limit ? data.limit : 100;
  data.current ? data.current : data.current = 1
  return await sql.select().orderBy('time', 'DESC').limit([(data.current -1) * limit, limit]).run()
    .then(async res => {
      const totalSql = new Sql({_table: 'error'})
      let result = {}
      result.records = res
      console.log(res, 5555);
      await totalSql.select('count(*) as total').run().then(item => result.total = item[0].total)
      return new SuccessModel(result)
    })
    .catch(err => new ErrorModel({code: err.errno, message: err.sqlMessage}))
}
const addFault = async (data) => {
  const sql = new Sql({_table: 'error'})
  // data.time = dayjs().format('YYYY-MM-DD HH:mm:ss')
  return await sql.insert(data).run().then(res => new SuccessModel(res))
    .catch(err => new ErrorModel({code: err.errno, message: err.sqlMessage}))
}


module.exports = {
  getAllFault,
  addFault
}