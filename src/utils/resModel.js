class BaseModel {
  constructor({ code, data, message }) {
    this.code = code
    if (data) {
      this.data = data
    }
    if (message) {
      this.message = message
    }
  }
}

/**
 * 成功的数据模型
 */
class SuccessModel extends BaseModel {
  constructor(data = {}) {
    super({
      code: 200,
      data,
      message: 'success',
    })
  }
}

/**
 * 失败的数据模型
 */
class ErrorModel extends BaseModel {
  constructor({ code = 1, message = "", data = [] }) {
    super({
      code,
      data,
      message,
    })
  }
}

module.exports = {
  SuccessModel,
  ErrorModel,
}