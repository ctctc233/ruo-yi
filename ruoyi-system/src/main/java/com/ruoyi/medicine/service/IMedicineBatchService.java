package com.ruoyi.medicine.service;

import java.util.List;
import com.ruoyi.medicine.domain.MedicineBatch;

/**
 * 药品-批次-关联表Service接口
 * 
 * @author ruoyi
 * @date 2025-01-26
 */
public interface IMedicineBatchService 
{
    /**
     * 查询药品-批次-关联表
     * 
     * @param id 药品-批次-关联表主键
     * @return 药品-批次-关联表
     */
    public MedicineBatch selectMedicineBatchById(Long id);

    /**
     * 查询药品-批次-关联表列表
     * 
     * @param medicineBatch 药品-批次-关联表
     * @return 药品-批次-关联表集合
     */
    public List<MedicineBatch> selectMedicineBatchList(MedicineBatch medicineBatch);

    /**
     * 新增药品-批次-关联表
     * 
     * @param medicineBatch 药品-批次-关联表
     * @return 结果
     */
    public int insertMedicineBatch(MedicineBatch medicineBatch);

    /**
     * 修改药品-批次-关联表
     * 
     * @param medicineBatch 药品-批次-关联表
     * @return 结果
     */
    public int updateMedicineBatch(MedicineBatch medicineBatch);

    /**
     * 批量删除药品-批次-关联表
     * 
     * @param ids 需要删除的药品-批次-关联表主键集合
     * @return 结果
     */
    public int deleteMedicineBatchByIds(Long[] ids);

    /**
     * 删除药品-批次-关联表信息
     * 
     * @param id 药品-批次-关联表主键
     * @return 结果
     */
    public int deleteMedicineBatchById(Long id);
}
