/**
 * 字符串的小驼峰改为下划线
 * @param {String} str
 */
const strToUnderLine = (str) => {
  return str.replace(/([A-Z])/g, '_$1').toLowerCase()
}

/**
 *  json对象的key值小驼峰转下划线
 * @param {Object} data
 */
const objToUnderLine = (data) => {
  if (typeof data != 'object' || !data) return data
  if (Array.isArray(data)) {
    return data.map(item => objToUnderLine(item))
  }
  Object.keys(data).forEach(function (key) {
    const newKey = strToUnderLine(key)
    if (newKey !== key) {
      data[newKey] = data[key]
      delete data[key]
    }
    objToUnderLine(data[newKey])
  })
  return data
}

/**
 * 字符串的下划线改为驼峰格式
 * @param {String} str
 */
const strToUpperCase = (str) => {
  return str.replace(/_(\w)/g, function (all, letter) {
    return letter.toUpperCase()
  })
}

/**
 *  json对象的key值转为驼峰式
 * @param {Object} data
 */
const objToUpperCase = (data) => {
  if (typeof data != 'object' || !data) return data
  if (Array.isArray(data)) {
    return data.map(item => objToUpperCase(item))
  }
  Object.keys(data).forEach(function (key) {
    const newKey = strToUpperCase(key)
    if (newKey !== key) {
      data[newKey] = data[key]
      delete data[key]
    }
    objToUpperCase(data[newKey])
  })
  return data
}

module.exports = {
  strToUnderLine,
  objToUnderLine,
  strToUpperCase,
  objToUpperCase
}