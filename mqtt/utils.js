exports.splitString = (str = '') => {
  let data = {}
  // str 0&0 分别作为smoke1 smoke1
  // console.log(str);
  let arr = str.split('&')
  data.smoke1 = arr[0]
  data.smoke2 = arr[1]
  return data
}

exports.splitBookData = (str = '') => {
  let data = {}
  console.log(str);
  let arr = str.split('&')
  data.id = arr[0]
  data.book_name = arr[1]
  data.position = arr[2]
  return data
}

exports.splitBookRecord = (str = '') => {
  let data = {}
  // 5000&001  用户id + 图书id
  let arr = str.split('&')
  data.person_id = arr[0]
  data.book_id = arr[1]
  return data
}
