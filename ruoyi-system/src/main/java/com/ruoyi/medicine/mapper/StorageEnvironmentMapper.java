package com.ruoyi.medicine.mapper;

import java.util.List;
import java.util.Map;

import com.ruoyi.medicine.domain.StorageEnvironment;

/**
 * 存放环境Mapper接口
 * 
 * @author ruoyi
 * @date 2025-01-24
 */
public interface StorageEnvironmentMapper
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
     * 删除存放环境
     * 
     * @param id 存放环境主键
     * @return 结果
     */
    public int deleteStorageEnvironmentById(Long id);

    /**
     * 批量删除存放环境
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteStorageEnvironmentByIds(Long[] ids);

    /**
     * 查询存放环境id
     *
     * @param location 存放环境位置
     * @return 结果
     */
    public long selectStorageEnvironmentId(String location);

    /**
     * 查询存放地点药品种类数量
     *
     * @return 结果
     */
    public List<Map<String, Object>> selectStorageCount();
}
