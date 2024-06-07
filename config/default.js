module.exports = {
  port: 3000,
  db: {
    host: '127.0.0.1',
    port: 3306,
    user: 'root',
    password: 'root',
    database: 'watar_iot',
    connectionLimit: 20,
    queueLimit: 0
  },
  mqtt: {
    port: 1884,
    publishTop: 'cmd',
    subscribeTop: ['verify', 'error', 'order', 'reOrder', 'data', 'reData', 'reanexar'],
  }
}
