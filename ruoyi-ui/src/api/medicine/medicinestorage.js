import request from '@/utils/request'

// 查询药品环境列表
export function listMedicinestorage(query) {
  return request({
    url: '/medicine/medicinestorage/list',
    method: 'get',
    params: query
  })
}

// 查询药品环境详细
export function getMedicinestorage(id) {
  return request({
    url: '/medicine/medicinestorage/' + id,
    method: 'get'
  })
}

// 新增药品环境
export function addMedicinestorage(data) {
  return request({
    url: '/medicine/medicinestorage',
    method: 'post',
    data: data
  })
}

// 修改药品环境
export function updateMedicinestorage(data) {
  return request({
    url: '/medicine/medicinestorage',
    method: 'put',
    data: data
  })
}

// 删除药品环境
export function delMedicinestorage(id) {
  return request({
    url: '/medicine/medicinestorage/' + id,
    method: 'delete'
  })
}
