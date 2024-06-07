const { SuccessModel, ErrorModel } = require('../utils/resModel')
const mqtt = require('../../mqtt/index')
const configService = require('./configService')

const publish = async (data, top = 'cmd') => {
  const updateData = {
    id: data.config_id,
    value: data.value,
  }
  console.log('config_id', data.config_id);
  await configService.updateConfig({value: data.value}, data.config_id)
  // const msg = data.message.split('?')[0] + data.value
  const msg = data.message.replace('?', data.value) 
  console.log(data,msg);

  mqtt.publishMqtt(msg, top)
  // console.log('msgggg',msg);
  return new SuccessModel({msg: '发送成功'})
}

const sendMqtt = async ({data, top}) => {
  const updateData = {
    id: data.config_id,
    value: data.value,
  }
  // const msg = data.message.split('?')[0] + data.value
  const msg = data.message.replace('?', data.value)
  await mqtt.publishMqtt(msg, top)
  // console.log('msgggg',msg);
  return new SuccessModel({msg: '发送成功'})
}

module.exports = {
  publish,
  sendMqtt
}