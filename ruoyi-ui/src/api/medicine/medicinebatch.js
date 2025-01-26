import request from '@/utils/request'

// 查询药品-批次-关联表列表
export function listMedicinebatch(query) {
  return request({
    url: '/medicine/medicinebatch/list',
    method: 'get',
    params: query
  })
}

// 查询药品-批次-关联表详细
export function getMedicinebatch(id) {
  return request({
    url: '/medicine/medicinebatch/' + id,
    method: 'get'
  })
}

// 新增药品-批次-关联表
export function addMedicinebatch(data) {
  return request({
    url: '/medicine/medicinebatch',
    method: 'post',
    data: data
  })
}

// 修改药品-批次-关联表
export function updateMedicinebatch(data) {
  return request({
    url: '/medicine/medicinebatch',
    method: 'put',
    data: data
  })
}

// 删除药品-批次-关联表
export function delMedicinebatch(id) {
  return request({
    url: '/medicine/medicinebatch/' + id,
    method: 'delete'
  })
}
