package com.ruoyi.medicine.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.medicine.mapper.MedicinestorageMapper;
import com.ruoyi.medicine.domain.Medicinestorage;
import com.ruoyi.medicine.service.IMedicinestorageService;

/**
 * 药品环境Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-01-24
 */
@Service
public class MedicinestorageServiceImpl implements IMedicinestorageService 
{
    @Autowired
    private MedicinestorageMapper medicinestorageMapper;

    /**
     * 查询药品环境
     * 
     * @param id 药品环境主键
     * @return 药品环境
     */
    @Override
    public Medicinestorage selectMedicinestorageById(Long id)
    {
        return medicinestorageMapper.selectMedicinestorageById(id);
    }

    /**
     * 查询药品环境列表
     * 
     * @param medicinestorage 药品环境
     * @return 药品环境
     */
    @Override
    public List<Medicinestorage> selectMedicinestorageList(Medicinestorage medicinestorage)
    {
        return medicinestorageMapper.selectMedicinestorageList(medicinestorage);
    }

    /**
     * 新增药品环境
     * 
     * @param medicinestorage 药品环境
     * @return 结果
     */
    @Override
    public int insertMedicinestorage(Medicinestorage medicinestorage)
    {
        medicinestorage.setCreateTime(DateUtils.getNowDate());
        return medicinestorageMapper.insertMedicinestorage(medicinestorage);
    }

    /**
     * 修改药品环境
     * 
     * @param medicinestorage 药品环境
     * @return 结果
     */
    @Override
    public int updateMedicinestorage(Medicinestorage medicinestorage)
    {
        medicinestorage.setUpdateTime(DateUtils.getNowDate());
        return medicinestorageMapper.updateMedicinestorage(medicinestorage);
    }

    /**
     * 批量删除药品环境
     * 
     * @param ids 需要删除的药品环境主键
     * @return 结果
     */
    @Override
    public int deleteMedicinestorageByIds(Long[] ids)
    {
        return medicinestorageMapper.deleteMedicinestorageByIds(ids);
    }

    /**
     * 删除药品环境信息
     * 
     * @param id 药品环境主键
     * @return 结果
     */
    @Override
    public int deleteMedicinestorageById(Long id)
    {
        return medicinestorageMapper.deleteMedicinestorageById(id);
    }
}
