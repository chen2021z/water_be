const Sql = require('../db/sql');
const { toTree } = require('../utils/changeData');
const { SuccessModel, ErrorModel } = require('../utils/resModel')
const dayjs = require('dayjs')

const getAllDeviceInfo = async (data) => {
  const sql = new Sql({ _table: 'water_device_info' });
  const limit = data.limit ? data.limit : 100;
  data.current ? data.current : data.current = 1
  const time = data.beforeTime && data.endTime ? `time > '${data.beforeTime}' and time <= '${data.endTime}'` : ``
  return await sql.select().where(time)
    .orderBy('time', 'DESC').limit([(data.current - 1) * limit, limit]).run()
    .then(async res => {
      // console.log(res);
      const totalSql = new Sql({ _table: 'water_device_info' })
      let result = {}
      result.records = res
      await totalSql.select('count(*) as total').where(data.beforeTime && data.endTime ? `time > '${data.beforeTime}' and time <= '${data.endTime}'` : ``)
        .run().then(item => {
          // console.log(item);
          result.total = item[0].total
        })
      return new SuccessModel(result)
    })
    .catch(err => new ErrorModel({ code: err.errno, message: err.sqlMessage }))
}

// 获取所有饮水机信息
const getAllDeviceStatus = async (data) => {
  const sql = new Sql({ _table: 'water_device' });
  const limit = data.limit ? data.limit : 100;
  data.current ? data.current : data.current = 1
  return await sql.select().limit([(data.current - 1) * limit, limit]).run()
    .then(async res => {
      // console.log(111111111,res);
      const totalSql = new Sql({ _table: 'water_device' })
      let result = {}
      result.records = res
      await totalSql.select('count(*) as total').where(data.beforeTime && data.endTime ? `time > '${data.beforeTime}' and time <= '${data.endTime}'` : ``)
        .run().then(item => {
          // console.log(item);
          result.total = item[0].total
        })
      return new SuccessModel(result)
    })
    .catch(err => new ErrorModel({ code: err.errno, message: err.sqlMessage }))
}


const addDeviceInfo = async (data) => {
  // data.time = dayjs().format('YYYY-MM-DD HH:mm:ss')
  // console.log(data);
  const sql = new Sql({ _table: 'water_device_info' })
  return await sql.insert(data).run().then(res => {
    return new SuccessModel(res)
  })
    .catch(err => new ErrorModel({ code: err.errno, message: err.sqlMessage }))
}


const updateDeviceStatus = async ({ data, id, idName = 'device_id' }) => {
  // console.log(data, id, idName);
  const sql = new Sql({ _table: 'water_device' })
  return await sql.update(data, id, idName).run().then(res => {
    return new SuccessModel(res)
  })
    .catch(err => new ErrorModel({ code: err.errno, message: err.sqlMessage }))
}

// 获取饮水机信息
const getDeviceStatus = async (data) => {
  // const deviceSql = `select book_record.*, book_data.book_name from book_record left join book_data  on book_record.book_id = book_data.id ${data.beforeTime && data.endTime ? `where book_record.time > '${data.beforeTime}' and book_record.time < '${data.endTime}'` : ""} order by book_record.time desc`
  const sql = new Sql({ _table: 'water_device' })
  // @ts-ignore
  return await sql.select().where(data)
    .run()
    .then(res => {
      // console.log(res);
      return new SuccessModel(res)
    })
    .catch(err => new ErrorModel({ code: err.errno, message: err.sqlMessage }))
}


module.exports = {
  getAllDeviceInfo,
  addDeviceInfo,
  getDeviceStatus,
  updateDeviceStatus,
  getAllDeviceStatus
}
