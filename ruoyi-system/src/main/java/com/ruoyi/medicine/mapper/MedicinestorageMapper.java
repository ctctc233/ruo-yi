package com.ruoyi.medicine.mapper;

import java.util.List;
import com.ruoyi.medicine.domain.Medicinestorage;

/**
 * 药品环境Mapper接口
 * 
 * @author ruoyi
 * @date 2025-01-24
 */
public interface MedicinestorageMapper 
{
    /**
     * 查询药品环境
     * 
     * @param id 药品环境主键
     * @return 药品环境
     */
    public Medicinestorage selectMedicinestorageById(Long id);

    /**
     * 查询药品环境列表
     * 
     * @param medicinestorage 药品环境
     * @return 药品环境集合
     */
    public List<Medicinestorage> selectMedicinestorageList(Medicinestorage medicinestorage);

    /**
     * 新增药品环境
     * 
     * @param medicinestorage 药品环境
     * @return 结果
     */
    public int insertMedicinestorage(Medicinestorage medicinestorage);

    /**
     * 修改药品环境
     * 
     * @param medicinestorage 药品环境
     * @return 结果
     */
    public int updateMedicinestorage(Medicinestorage medicinestorage);

    /**
     * 删除药品环境通过药品id
     * 
     * @param id 药品主键
     * @return 结果
     */
    public int deleteMedicinestorageById(Long id);

    /**
     * 批量删除药品环境
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMedicinestorageByIds(Long[] ids);

    /**
     * 批量删除药品环境通过药品id
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMedicinestorageByMedIds(Long[] ids);
}
