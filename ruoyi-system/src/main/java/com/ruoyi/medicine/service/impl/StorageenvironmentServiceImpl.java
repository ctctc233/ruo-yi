package com.ruoyi.medicine.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.medicine.mapper.StorageenvironmentMapper;
import com.ruoyi.medicine.domain.Storageenvironment;
import com.ruoyi.medicine.service.IStorageenvironmentService;

/**
 * 存放环境Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-01-24
 */
@Service
public class StorageenvironmentServiceImpl implements IStorageenvironmentService 
{
    @Autowired
    private StorageenvironmentMapper storageenvironmentMapper;

    /**
     * 查询存放环境
     * 
     * @param id 存放环境主键
     * @return 存放环境
     */
    @Override
    public Storageenvironment selectStorageenvironmentById(Long id)
    {
        return storageenvironmentMapper.selectStorageenvironmentById(id);
    }

    /**
     * 查询存放环境列表
     * 
     * @param storageenvironment 存放环境
     * @return 存放环境
     */
    @Override
    public List<Storageenvironment> selectStorageenvironmentList(Storageenvironment storageenvironment)
    {
        return storageenvironmentMapper.selectStorageenvironmentList(storageenvironment);
    }

    /**
     * 新增存放环境
     * 
     * @param storageenvironment 存放环境
     * @return 结果
     */
    @Override
    public int insertStorageenvironment(Storageenvironment storageenvironment)
    {
        storageenvironment.setCreateTime(DateUtils.getNowDate());
        return storageenvironmentMapper.insertStorageenvironment(storageenvironment);
    }

    /**
     * 修改存放环境
     * 
     * @param storageenvironment 存放环境
     * @return 结果
     */
    @Override
    public int updateStorageenvironment(Storageenvironment storageenvironment)
    {
        storageenvironment.setUpdateTime(DateUtils.getNowDate());
        return storageenvironmentMapper.updateStorageenvironment(storageenvironment);
    }

    /**
     * 批量删除存放环境
     * 
     * @param ids 需要删除的存放环境主键
     * @return 结果
     */
    @Override
    public int deleteStorageenvironmentByIds(Long[] ids)
    {
        return storageenvironmentMapper.deleteStorageenvironmentByIds(ids);
    }

    /**
     * 删除存放环境信息
     * 
     * @param id 存放环境主键
     * @return 结果
     */
    @Override
    public int deleteStorageenvironmentById(Long id)
    {
        return storageenvironmentMapper.deleteStorageenvironmentById(id);
    }
}
