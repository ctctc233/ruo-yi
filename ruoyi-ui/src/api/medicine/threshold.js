import request from '@/utils/request'

// 查询药品临界阈值列表
export function listThreshold(query) {
  return request({
    url: '/medicine/threshold/list',
    method: 'get',
    params: query
  })
}

// 查询药品临界阈值详细
export function getThreshold(id) {
  return request({
    url: '/medicine/threshold/' + id,
    method: 'get'
  })
}

// 新增药品临界阈值
export function addThreshold(data) {
  return request({
    url: '/medicine/threshold',
    method: 'post',
    data: data
  })
}

// 修改药品临界阈值
export function updateThreshold(data) {
  return request({
    url: '/medicine/threshold',
    method: 'put',
    data: data
  })
}

// 删除药品临界阈值
export function delThreshold(id) {
  return request({
    url: '/medicine/threshold/' + id,
    method: 'delete'
  })
}
