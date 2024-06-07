const app = require('../app')
const { createServer } = require("http");
const Socket = require('../ws')
const Mqtt = require('../mqtt')
const httpServer = createServer(app)
const config = require('../config')

// socket
Socket.init(httpServer);
Mqtt.init();

httpServer.listen(3000, () => {
  console.log('服务启动成功!');
  console.log('当前环境：', process.env.NODE_ENV);
  console.log('配置项：', JSON.stringify(config));
  console.log('express端口：', config.port);
  console.log('mqtt端口：', config.mqtt.port);
})