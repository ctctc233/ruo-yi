package com.ruoyi.medicine.service;

import java.util.List;
import com.ruoyi.medicine.domain.Medicine;
import com.ruoyi.medicine.domain.MedicineExpirationApproaching;
import com.ruoyi.medicine.domain.MedicinePro;

/**
 * 药品Service接口
 * 
 * @author ruoyi
 * @date 2025-01-24
 */
public interface IMedicineService 
{
    /**
     * 查询药品
     * 
     * @param id 药品主键
     * @return 药品
     */
    public MedicinePro selectMedicineById(Long id);

    /**
     * 查询药品列表
     * 
     * @param medicine 药品
     * @return 药品集合
     */
    public List<MedicinePro> selectMedicineList(MedicinePro medicine);

    /**
     * 查询/处理药品临期列表
     *
     * @param medicine 药品
     * @return 药品集合
     */
    public List<MedicineExpirationApproaching> selectNearExpirationMedicineslist(MedicinePro medicine);

    /**
     * 新增药品
     * 
     * @param medicine 药品
     * @return 结果
     */
    public int insertMedicine(MedicinePro medicine);

    /**
     * 修改药品
     * 
     * @param medicinePro 药品
     * @return 结果
     */
    public int updateMedicine(MedicinePro medicinePro);

    /**
     * 药品出库
     *
     * @param name 需要出库的药品名、主键、地点
     * @return 结果
     */
    public int outMedicine(String name, Long outNum, String location);

    /**
     * 药品出库查询
     *
     * @param name 需要出库的药品名、主键、地点
     * @return 结果
     */
    public List<MedicinePro> outMedicineDetail(String name, String location);

    /**
     * 药品库存查询
     *
     * @return 结果
     */
    public Long selectMedicineStock(String name, String location);

    /**
     * 批量删除药品
     * 
     * @param ids 需要删除的药品主键集合
     * @return 结果
     */
    public int deleteMedicineByIds(Long[] ids);

    /**
     * 删除药品信息
     * 
     * @param id 药品主键
     * @return 结果
     */
    public int deleteMedicineById(Long id);

    /**
     * 查询过期药品信息
     *
     * @return 结果
     */
    public List<Medicine> selectExpiredMedicine();

    /**
     * 查询药品详情
     *
     * @return 结果
     */
    public List<MedicinePro> selectMedicineDetail(Long number);
}
