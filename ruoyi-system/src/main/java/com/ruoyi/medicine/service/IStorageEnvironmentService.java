package com.ruoyi.medicine.service;

import java.util.List;
import java.util.Map;

import com.ruoyi.medicine.domain.StorageEnvironment;

/**
 * 存放环境Service接口
 * 
 * @author ruoyi
 * @date 2025-01-24
 */
public interface IStorageEnvironmentService
{
    /**
     * 查询存放环境
     * 
     * @param id 存放环境主键
     * @return 存放环境
     */
    public StorageEnvironment selectStorageEnvironmentById(Long id);

    /**
     * 查询存放环境列表
     * 
     * @param storageenvironment 存放环境
     * @return 存放环境集合
     */
    public List<StorageEnvironment> selectStorageEnvironmentList(StorageEnvironment storageenvironment);

    /**
     * 新增存放环境
     * 
     * @param storageenvironment 存放环境
     * @return 结果
     */
    public int insertStorageEnvironment(StorageEnvironment storageenvironment);

    /**
     * 修改存放环境
     * 
     * @param storageenvironment 存放环境
     * @return 结果
     */
    public int updateStorageEnvironment(StorageEnvironment storageenvironment);

    /**
     * 批量删除存放环境
     * 
     * @param ids 需要删除的存放环境主键集合
     * @return 结果
     */
    public int deleteStorageEnvironmentByIds(Long[] ids);

    /**
     * 删除存放环境信息
     * 
     * @param id 存放环境主键
     * @return 结果
     */
    public int deleteStorageEnvironmentById(Long id);

    /**
     * 查询存放地点药品种类数量
     *
     * @return 结果
     */
    public List<Map<String, Object>> selectStorageCount();
}
