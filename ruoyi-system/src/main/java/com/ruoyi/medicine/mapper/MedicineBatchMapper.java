package com.ruoyi.medicine.mapper;

import java.util.List;
import com.ruoyi.medicine.domain.MedicineBatch;

/**
 * 药品-批次-关联表Mapper接口
 * 
 * @author ruoyi
 * @date 2025-01-26
 */
public interface MedicineBatchMapper 
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
     * 删除药品-批次-关联表
     * 
     * @param id 药品-批次-关联表主键
     * @return 结果
     */
    public int deleteMedicineBatchById(Long id);

    /**
     * 批量删除药品-批次-关联表
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMedicineBatchByIds(Long[] ids);

    /**
     * 批量删除药品-批次-关联表根据药品id
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMedicineBatchByMedIds(Long[] ids);
}
