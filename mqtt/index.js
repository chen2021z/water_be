const mosca = require("mosca");
const mqtt = require("mqtt");
const { publishTop, subscribeTop, port } =
  require("../config").mqtt;
const { splitString, splitBookData, splitBookRecord } = require("./utils");
const dayjs = require("dayjs");
const { getAllFault, addFault } = require("../src/service/faultService");
const { verify } = require("../src/service/studentService");
const { getAllOrder, addOrder } = require("../src/service/orderService");
const { getAllDeviceInfo, addDeviceInfo, getDeviceStatus, updateDeviceStatus } = require("../src/service/deviceService");

const Socket = require("../ws/index");

class Mqtt {
  // static disConnectedTime = null

  static initMqtt() {
    this.MqttServer = new mosca.Server({
      port,
    });

    this.MqttServer.on("clientConnected", function (client) {
      //当有客户端连接时的回调.
      console.log("client connected", client.id);
      Socket.send("linked", client.id + "连接成功");
    });

    /**
     * 监听MQTT主题消息
     * 当客户端有连接发布主题消息时
     **/
    this.MqttServer.on("published", function (packet, client) {
      // console.log(packet.payload.toString())
    });

    this.MqttServer.on("ready", function () {
      // 当服务开启时的回调
      console.log("mqtt is running...");
    });

    const that = this;
    this.MqttServer.on("clientDisconnected", function (client) {
      // 当断开连接
      // if (client.id == 'cId') {
      // console.log('client disconnected: ', client.id)
      // that.disConnectedTime = dayis().format('YYYY-MM-DD HH:mm:ss')
      // let obj = {}
      // keys.forEach(item => {
      //   obj[item] = '断开连接'
      // })
      // console.log(obj, '断开连接')
      Socket.send("fault", client.id + "断开连接");
      // console.log('socket send');
      // }
    });

    this.MqttServer.on("close", () => {
      console.log("mqtt: connection closed");
    });
  }

  static client = null;

  static publishMqtt(message, publishTop = 'cmd', config = { qos: 0, retain: false }) {
    if (typeof message === "object") {
      message = JSON.stringify(message);
    } else {
      message = message.toString();
    }
    console.log(message);
    this.client.publish(publishTop, message, config);
    return
  }

  static async initSub() {
    this.client = await mqtt.connect("mqtt://localhost:" + port); // 连接到mqtt服务端

    const that = this;
    this.client.on("connect", function () {
      subscribeTop.forEach((item) => {
        that.client.subscribe(item);
        // console.log("订阅主题：" + item);
      });
    });

    this.client.on("message", async function (top, message) {
      message = message.toString();
      console.log("当前topic：", top, "收到的消息:", message);
      let val = null; 
      let res = null
      switch (top) {
        case "verify":
          val = JSON.parse(message)
          res = await verify(val)
          let flag = res.data.total > 0 ? 1 : 0
          Mqtt.publishMqtt(flag, 'verify2')
          break;
        case "error":
          val = JSON.parse(message)
          let data = { status: 2 }
          if (val.error_msg == 'warning') {
            data.status = 3
          } else if (val.error_msg == 'error') {
            data.status = 4
          }
          await addFault(val)
          if (val.error_msg) {
            Socket.send("fault", val.error_msg);
          }
          updateDeviceStatus({ data, id: val.device_id, idName: 'device_id' })
          break;
        case "order":
          val = JSON.parse(message)
          console.log(val,888888888888);
          addOrder(val)
          Socket.send("addOrder", val);
          break;
        case "reOrder":
          val = JSON.parse(message)
          val.status = 2
          addOrder(val)
          Socket.send("addOrder", val);
          break;
        case "data":
          val = JSON.parse(message)
          addDeviceInfo(val)
          break;
        case "reData":
          val = JSON.parse(message)
          val.status = 2
          addDeviceInfo(val)
          break;
        case "reanexar":
          val = JSON.parse(message)
          res = await getDeviceStatus(val)
          // 发送实时时间
          // console.log(val);
          // console.log(res.data[0],5555555);
          if (res.data[0].status != 2) {
            res.data[0].status = 1
          }
          res.data[0].settime = dayjs().format('HH:mm:ss')
          Mqtt.publishMqtt(res.data[0], 'reanexar2')
          // console.log(res.data[0], 99999);
          break;
      }
    });
  }



  static init() {
    this.initMqtt();
    this.initSub();
  }
}

module.exports = Mqtt;
