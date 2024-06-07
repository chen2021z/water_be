const Sql = require('../db/sql')
const { SuccessModel, ErrorModel } = require('../utils/resModel')

const getAllConfig = async () => {
  const sql = new Sql({_table: 'config'})
  return await sql.select().run()
    .then(res => new SuccessModel(res))
    .catch(err => new ErrorModel({code: err.errno, message: err.sqlMessage}))
}

const getConfig = async (config) => {
  const sql = new Sql({_table: 'config'})
  return await sql.select().where({config:config}).orderBy('ctime', 'DESC').run()
    .then(res => new SuccessModel(res))
    .catch(err => new ErrorModel({code: err.errno, message: err.sqlMessage}))
}

const addConfig = async (data) => {
  const sql = new Sql({_table: 'config'})
  return await sql.insert(data).run().then(res => new SuccessModel())
    .catch(err => new ErrorModel({code: err.errno, message: err.sqlMessage}))
}

const updateConfig = async (data, idVal) => {
  const sql = new Sql({_table: 'config'})
  return await sql.update(data, idVal).run()
    .then(res => new SuccessModel())
    .catch(err => new ErrorModel({code: err.errno, message: err.sqlMessage}))
}

const deleteConfig = async (settingId) => {
  const sql = new Sql({_table: 'config'})
  return await sql.delete().where({ id: settingId }).run()
    .then(res => new SuccessModel())
    .catch(err => new ErrorModel({code: err.errno, message: err.sqlMessage}))
}

module.exports = {
  getAllConfig,
  getConfig,
  addConfig,
  updateConfig,
  deleteConfig
}