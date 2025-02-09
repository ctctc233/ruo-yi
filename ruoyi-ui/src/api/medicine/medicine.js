import request from '@/utils/request'

// 查询药品列表
export function listMedicine(query) {
  return request({
    url: '/medicine/medicine/list',
    method: 'get',
    params: query
  })
}

export function MedicineType() {
  return request({
    url: '/api/medicine',
    method: 'get',
  })
}


// 查询药品详细
export function getMedicine(id) {
  return request({
    url: '/medicine/medicine/' + id,
    method: 'get'
  })
}

// 新增药品
export function addMedicine(data) {
  return request({
    url: '/medicine/medicine',
    method: 'post',
    data: data
  })
}

// 修改药品
export function updateMedicine(data) {
  return request({
    url: '/medicine/medicine',
    method: 'put',
    data: data
  })
}

// 删除药品
export function delMedicine(id) {
  return request({
    url: '/medicine/medicine/' + id,
    method: 'delete'
  })
}

//出库药品
export function outMedicine(data) {
  return request({
    url: '/medicine/medicine/outMedicine',
    method: 'PUT',
    data: data
  })
}
