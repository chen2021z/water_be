exports.changeFilterData = (arg) => {
  if (arg.constructor === String) {
    return arg
  } else if (arg.constructor === Object) {
    const filter = Object.keys(arg).reduce(function(a, k){
      if (arg[k] == undefined || arg[k] == null || arg[k] === '' ){
        return a
      }
      a.push(k+' = '+ `'${arg[k]}'`)
      return a
    },[]).join(' AND ')
    return filter
  }
}

exports.changeInsertData = (arg) => {
  let arr = []
  let valuesArr = []
  let itemArr, keys, values
  if (arg.constructor === Object) {
    arr.push(arg)
    for(let item of arr) {
      valuesArr.push(`${Object.values(item).map(i => i == undefined || i == null || i === ''  ? `''` : `'${i}'`)}`)
    }
    keys = Object.keys(arr[0]).toString()
    values = valuesArr.toString()
  } else if (Array.isArray(arg)) {
    arr = arg
    arg.forEach((ele = []) => {
      console.log(ele, 'ele')
      for(let item of ele) {
        itemArr = `${Object.values(item).map(i => i == undefined || i == null || i === ''  ? `''` : `'${i}'`)}`
        valuesArr.push(`(${itemArr})`)
      }
    })
    keys = Object.keys(arr[0][0])
  }

  values = valuesArr.toString()
  return data = { keys, values }
}

exports.changeSetData = (arg) => {
  const arr = Object.keys(arg).reduce(function(a, k){
    if (arg[k] == undefined || arg[k] == null || arg[k] === '' ){
      return a
    }
    a.push(k+' = '+ `'${arg[k]}'`)
    return a
  },[])
  return arr.toString()
}

exports.groupBy = ({ array, tranf = {}, isArray = false, fn }) => {
  const groups = {}
  array.forEach(function (item) {
    const group = JSON.stringify(fn(item))
    groups[group] = groups[group] || []
    groups[group].push(item)
  })


  return Object.keys(groups).map(function (group) {
  //  return groups[group]
    return !isArray ?
      {
        type: tranf[group + ''],
        record: groups[group]
      } : groups[group]
  })
}

exports.toTree = ({data, key, objKey = [], listKey = [], listName = 'list' }) => {
  let old = []
  data.forEach(el => {
    let oldObj = {}
    objKey.forEach(key => {
      oldObj[key] = el[key] ? el[key] : ''
    })
    oldObj[listName] = []
    let listObj = {}
    listKey.forEach(key => {
      listObj[key] = el[key] ? el[key] : ''
    })
    oldObj[listName].push(listObj)
    old.push(oldObj)
  })
  let newData = [] // 目标数组
  let newObj = {}
  old.forEach((el, i) => {
    if (!newObj[el[key]]) {
      newData.push(el)
      newObj[el[key]] = true
    } else {
      newData.forEach(el => {
        if (el[key] === old[i][key]) {
          el[listName] = [...el[listName], ...old[i][listName]]
        }
      })
    }
  })
  return newData
}
