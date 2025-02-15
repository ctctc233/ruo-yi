package com.ruoyi.medicine.service.impl;

import java.util.List;
import java.util.Map;

import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.medicine.mapper.StorageEnvironmentMapper;
import com.ruoyi.medicine.domain.StorageEnvironment;
import com.ruoyi.medicine.service.IStorageEnvironmentService;

/**
 * 存放环境Service业务层处理
 *
 * @author ruoyi
 * @date 2025-01-24
 */
@Service
public class StorageEnvironmentServiceImpl implements IStorageEnvironmentService {
	@Autowired
	private StorageEnvironmentMapper storageenvironmentMapper;

	/**
	 * 查询存放环境
	 *
	 * @param id 存放环境主键
	 * @return 存放环境
	 */
	@Override
	public StorageEnvironment selectStorageEnvironmentById(Long id) {
		return storageenvironmentMapper.selectStorageEnvironmentById(id);
	}

	/**
	 * 查询存放环境列表
	 *
	 * @param storageenvironment 存放环境
	 * @return 存放环境
	 */
	@Override
	public List<StorageEnvironment> selectStorageEnvironmentList(StorageEnvironment storageenvironment) {
		return storageenvironmentMapper.selectStorageEnvironmentList(storageenvironment);
	}

	/**
	 * 新增存放环境
	 *
	 * @param storageenvironment 存放环境
	 * @return 结果
	 */
	@Override
	public int insertStorageEnvironment(StorageEnvironment storageenvironment) {
		storageenvironment.setCreateTime(DateUtils.getNowDate());
		return storageenvironmentMapper.insertStorageEnvironment(storageenvironment);
	}

	/**
	 * 修改存放环境
	 *
	 * @param storageenvironment 存放环境
	 * @return 结果
	 */
	@Override
	public int updateStorageEnvironment(StorageEnvironment storageenvironment) {
		storageenvironment.setUpdateTime(DateUtils.getNowDate());
		return storageenvironmentMapper.updateStorageEnvironment(storageenvironment);
	}

	/**
	 * 批量删除存放环境
	 *
	 * @param ids 需要删除的存放环境主键
	 * @return 结果
	 */
	@Override
	public int deleteStorageEnvironmentByIds(Long[] ids) {
		return storageenvironmentMapper.deleteStorageEnvironmentByIds(ids);
	}

	/**
	 * 删除存放环境信息
	 *
	 * @param id 存放环境主键
	 * @return 结果
	 */
	@Override
	public int deleteStorageEnvironmentById(Long id) {
		return storageenvironmentMapper.deleteStorageEnvironmentById(id);
	}

	@Override
	public List<Map<String, Object>> selectStorageCount() {
		return storageenvironmentMapper.selectStorageCount();
	}
}
