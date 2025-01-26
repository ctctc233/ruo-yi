package com.ruoyi.medicine.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.medicine.mapper.MedicineBatchMapper;
import com.ruoyi.medicine.domain.MedicineBatch;
import com.ruoyi.medicine.service.IMedicineBatchService;

/**
 * 药品-批次-关联表Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-01-26
 */
@Service
public class MedicineBatchServiceImpl implements IMedicineBatchService 
{
    @Autowired
    private MedicineBatchMapper medicineBatchMapper;

    /**
     * 查询药品-批次-关联表
     * 
     * @param id 药品-批次-关联表主键
     * @return 药品-批次-关联表
     */
    @Override
    public MedicineBatch selectMedicineBatchById(Long id)
    {
        return medicineBatchMapper.selectMedicineBatchById(id);
    }

    /**
     * 查询药品-批次-关联表列表
     * 
     * @param medicineBatch 药品-批次-关联表
     * @return 药品-批次-关联表
     */
    @Override
    public List<MedicineBatch> selectMedicineBatchList(MedicineBatch medicineBatch)
    {
        return medicineBatchMapper.selectMedicineBatchList(medicineBatch);
    }

    /**
     * 新增药品-批次-关联表
     * 
     * @param medicineBatch 药品-批次-关联表
     * @return 结果
     */
    @Override
    public int insertMedicineBatch(MedicineBatch medicineBatch)
    {
        medicineBatch.setCreateTime(DateUtils.getNowDate());
        return medicineBatchMapper.insertMedicineBatch(medicineBatch);
    }

    /**
     * 修改药品-批次-关联表
     * 
     * @param medicineBatch 药品-批次-关联表
     * @return 结果
     */
    @Override
    public int updateMedicineBatch(MedicineBatch medicineBatch)
    {
        medicineBatch.setUpdateTime(DateUtils.getNowDate());
        return medicineBatchMapper.updateMedicineBatch(medicineBatch);
    }

    /**
     * 批量删除药品-批次-关联表
     * 
     * @param ids 需要删除的药品-批次-关联表主键
     * @return 结果
     */
    @Override
    public int deleteMedicineBatchByIds(Long[] ids)
    {
        return medicineBatchMapper.deleteMedicineBatchByIds(ids);
    }

    /**
     * 删除药品-批次-关联表信息
     * 
     * @param id 药品-批次-关联表主键
     * @return 结果
     */
    @Override
    public int deleteMedicineBatchById(Long id)
    {
        return medicineBatchMapper.deleteMedicineBatchById(id);
    }
}
