import request from '@/utils/request'

// 查询药品规格列表
export function listSpecificationattribute(query) {
  return request({
    url: '/medicine/specificationattribute/list',
    method: 'get',
    params: query
  })
}

// 查询药品规格详细
export function getSpecificationattribute(id) {
  return request({
    url: '/medicine/specificationattribute/' + id,
    method: 'get'
  })
}

// 新增药品规格
export function addSpecificationattribute(data) {
  return request({
    url: '/medicine/specificationattribute',
    method: 'post',
    data: data
  })
}

// 修改药品规格
export function updateSpecificationattribute(data) {
  return request({
    url: '/medicine/specificationattribute',
    method: 'put',
    data: data
  })
}

// 删除药品规格
export function delSpecificationattribute(id) {
  return request({
    url: '/medicine/specificationattribute/' + id,
    method: 'delete'
  })
}
