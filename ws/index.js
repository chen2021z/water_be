const { Server } = require("socket.io");

class Socket {
  static io = null

  static init(httpServer) {
    this.io = new Server(httpServer, {
      cors: {
        origin: '*'
      }
    })
    // console.log('this.io',this.io);

    this.io.on('connection', function(socket) {
      console.log('建立websocket连接')

      socket.on('disconnect', function() {
        console.log('断开')
      })

      const that = this

      // 监听
      socket.on("esp8266", (msg) => {
        // if (msg?.isEmit) {
        //   that.emit(msg?.emitTop, msg?.value)
        // }
        console.log(msg);
      })
    })
  }

  // 发送
  static send(top, msg) {
    if (this.io) {
      this.io.emit(top, msg);
    }
  }
}

module.exports = Socket;