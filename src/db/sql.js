const pool = require('./mysql')
const changedata = require('../utils/changeData')


// 简单封装一些mysql方法构建一个db类
class Sql {
  constructor({
    _table = '',
    sql = '',
    debug = 1
  }) {
    this._table = _table
    this.sql = sql
    this.debug = debug
    this.sqlWarpper = {
      tableWarpper: '',
      whereWarrpper: '',
      limitWarpper: '',
      groupByWarpper: '',
      havingWarpper: '',
      orderWarpper: ''
    }
  }
  // 清除缓存数据
  done() {
    this.sql = '' // 最后拼接成的SQL语句
    this._table = '' // 一开始暂存的表名
    this.sqlWarpper = {
      tableWarpper: '',
      whereWarrpper: '',
      limitWarpper: '',
      groupByWarpper: '',
      havingWarpper: '',
      orderWarpper: ''
    }
  }
  // 执行数据库操作
  run() {
    const _sql = this.createSql()
    //debug模式打印出SQL语句
    if (this.debug) console.log(_sql)
    const table = this._table
    const hasSql = this.sql

    //注意在进行数据库查询的前一刻，应该把之前缓存的字符串清空掉。
    this.done()
    //基于Promise封装
    return new Promise((resolve, reject) => {
      if (!hasSql && !table) {
        reject('表名不可为空')
      } else {
        //进行数据库查询
        console.log('去执行数据库了')
        pool.getConnection((err, con) => {
          if (err) {
            reject(err)
          } else {
            con.query(_sql, (err, result) => {
              if (err) {
                reject(err)
              } else {
                // resolve(result)
                resolve(JSON.parse(JSON.stringify(result)))
                con.release()
              }
            })
          }
          
        })
      }
    })

  }
  // 运行事务
  runTransaction(connection) {
    const _sql = this.createSql()
    //debug模式打印出SQL语句
    if (this.debug) console.log(_sql)
    const table = this._table
    const hasSql = this.sql
    //注意在进行数据库查询的前一刻，应该把之前缓存的字符串清空掉。
    this.done()
    //基于Promise封装
    return new Promise((resolve, reject) => {
      if (!table && !hasSql) {
        reject('表名不可为空')
      } else {
        connection.query(_sql, (err, result) => {
          if (err) {
            reject(err)
          } else {
            resolve(JSON.parse(JSON.stringify(result)))
          }
        })
      }
    })
  }
  createSql() {
    if (this.sql) return this.sql
    return this.sqlWarpper.tableWarpper + ' ' + this.sqlWarpper.whereWarrpper + ' ' + this.sqlWarpper.groupByWarpper +
      ' ' + this.sqlWarpper.havingWarpper + ' ' + this.sqlWarpper.orderWarpper + ' ' + this.sqlWarpper.limitWarpper
  }
  /**
   *
   * @param  {...any} _cols 查询字段
   */
  select(..._cols) {
    let cols = [..._cols]
    if (cols.length != 0) {
      const c = cols.toString()
      this.sqlWarpper.tableWarpper = `SELECT ${c} FROM \`${this._table}\``
    } else {
      this.sqlWarpper.tableWarpper = `SELECT * FROM \`${this._table}\``
    }
    return this
  }
  /**
   *
   * @param {*} obj 插入的对象
   */
  insert(obj) {
    const data = changedata.changeInsertData(obj)
    this.sqlWarpper.tableWarpper = `INSERT INTO \`${this._table}\` (${data.keys}) VALUES (${data.values})`
    return this
  }
  /**
   *
   * @param  {...any} arg 批量插入数组
   */
  insertBatch(...arg) {
    if (!Array.isArray(arg)) throw new TypeError('请传入正确的类型')
    const arr = arg
    const batchs = changedata.changeInsertData(arr)
    if (batchs) {
      this.sqlWarpper.tableWarpper = `INSERT INTO ${this._table} (${batchs.keys}) VALUES ${batchs.values}`
    }
    return this
  }
  /**
   *
   * @param {*} obj 更新数据
   */
  update(obj, col, idName = 'id') {
    const setData = changedata.changeSetData(obj)
    this.sqlWarpper.tableWarpper = `UPDATE ${this._table} SET ${setData} WHERE ${col} = ${idName}`
    return this
  }
  /**
   *
   * @param  {...any} arg 根据id更新多条数据
   */
  updateBatchById(...arg) {
    if (!Array.isArray(arg)) throw new TypeError('请传入正确的类型')
    const arr = [...arg]
    for (item in arr) {
      this.update(item).where(`id = ${item?.id}`)
    }
  }
  /**
   * 删除
   */
  delete() {
    this.sqlWarpper.tableWarpper = `DELETE FROM ${this._table}`
    return this
  }
  /**
   *
   * @param  {any} arg 查询条件
   * @param {*} type and 或者 or
   */
  where(arg, type = 'AND') {
    if (arg == null || arg == undefined) throw new Error('数据类型不对')
    const filter = changedata.changeFilterData(arg)
    if (filter) {
      if (this.sqlWarpper.whereWarrpper) {
        this.sqlWarpper.whereWarrpper += ` ${type} (${filter})`
      } else {
        this.sqlWarpper.whereWarrpper = `WHERE (${filter})`
      }
    }
    return this
  }
  /**
   *
   * @param {*} table 表名
   */
  table(table) {
    this._table = table
    return this
  }
  /**
   *
   * @param {*} limit 限制数量，数组或者单独数字
   */
  limit(limit) {
    if (limit === undefined) return limit
    if (Array.isArray(limit) && limit.length === 2) {
      this.sqlWarpper.limitWarpper = `LIMIT ${limit[0]},${limit[1]}`
    } else {
      this.sqlWarpper.limitWarpper = `LIMIT ${limit}`
    }
    return this
  }
  /**
   *
   * @param {.. .any} _cols 排序条件
   * @param {*} orderBy 排序方法
   */
  orderBy(_cols, orderBy) {
    const c = _cols.toString()
    this.sqlWarpper.orderWarpper = `ORDER BY ${c} ${orderBy ? orderBy : ''}`
    return this
  }
  /**
   *
   * @param  {...any} _cols 分组条件
   */
  groupBy(..._cols) {
    let cols = [..._cols]
    if (cols.length === 0) return null
    const c = cols.toString()
    this.sqlWarpper.groupByWarpper = `GROUP BY ${c}`
    return this
  }
  /**
   *
   * @param  {...any} arg 分组后的过滤条件
   */
  having(...arg) {
    const filter = changedata.changeFilterData(...arg)
    this.sqlWarpper.havingWarpper = `HAVING (${filter})`
    return this
  }



}

module.exports = Sql
