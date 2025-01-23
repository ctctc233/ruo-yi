package com.ruoyi.medicine.service;

import java.util.List;
import com.ruoyi.medicine.domain.Storageenvironment;

/**
 * 存放环境Service接口
 * 
 * @author ruoyi
 * @date 2025-01-24
 */
public interface IStorageenvironmentService 
{
    /**
     * 查询存放环境
     * 
     * @param id 存放环境主键
     * @return 存放环境
     */
    public Storageenvironment selectStorageenvironmentById(Long id);

    /**
     * 查询存放环境列表
     * 
     * @param storageenvironment 存放环境
     * @return 存放环境集合
     */
    public List<Storageenvironment> selectStorageenvironmentList(Storageenvironment storageenvironment);

    /**
     * 新增存放环境
     * 
     * @param storageenvironment 存放环境
     * @return 结果
     */
    public int insertStorageenvironment(Storageenvironment storageenvironment);

    /**
     * 修改存放环境
     * 
     * @param storageenvironment 存放环境
     * @return 结果
     */
    public int updateStorageenvironment(Storageenvironment storageenvironment);

    /**
     * 批量删除存放环境
     * 
     * @param ids 需要删除的存放环境主键集合
     * @return 结果
     */
    public int deleteStorageenvironmentByIds(Long[] ids);

    /**
     * 删除存放环境信息
     * 
     * @param id 存放环境主键
     * @return 结果
     */
    public int deleteStorageenvironmentById(Long id);
}
