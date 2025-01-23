import request from '@/utils/request'

// 查询存放环境列表
export function listStorageenvironment(query) {
  return request({
    url: '/medicine/storageenvironment/list',
    method: 'get',
    params: query
  })
}

// 查询存放环境详细
export function getStorageenvironment(id) {
  return request({
    url: '/medicine/storageenvironment/' + id,
    method: 'get'
  })
}

// 新增存放环境
export function addStorageenvironment(data) {
  return request({
    url: '/medicine/storageenvironment',
    method: 'post',
    data: data
  })
}

// 修改存放环境
export function updateStorageenvironment(data) {
  return request({
    url: '/medicine/storageenvironment',
    method: 'put',
    data: data
  })
}

// 删除存放环境
export function delStorageenvironment(id) {
  return request({
    url: '/medicine/storageenvironment/' + id,
    method: 'delete'
  })
}
