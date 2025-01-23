package com.ruoyi.medicine.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.medicine.mapper.BatchMapper;
import com.ruoyi.medicine.domain.Batch;
import com.ruoyi.medicine.service.IBatchService;

/**
 * 批次Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-01-24
 */
@Service
public class BatchServiceImpl implements IBatchService 
{
    @Autowired
    private BatchMapper batchMapper;

    /**
     * 查询批次
     * 
     * @param id 批次主键
     * @return 批次
     */
    @Override
    public Batch selectBatchById(Long id)
    {
        return batchMapper.selectBatchById(id);
    }

    /**
     * 查询批次列表
     * 
     * @param batch 批次
     * @return 批次
     */
    @Override
    public List<Batch> selectBatchList(Batch batch)
    {
        return batchMapper.selectBatchList(batch);
    }

    /**
     * 新增批次
     * 
     * @param batch 批次
     * @return 结果
     */
    @Override
    public int insertBatch(Batch batch)
    {
        batch.setCreateTime(DateUtils.getNowDate());
        return batchMapper.insertBatch(batch);
    }

    /**
     * 修改批次
     * 
     * @param batch 批次
     * @return 结果
     */
    @Override
    public int updateBatch(Batch batch)
    {
        batch.setUpdateTime(DateUtils.getNowDate());
        return batchMapper.updateBatch(batch);
    }

    /**
     * 批量删除批次
     * 
     * @param ids 需要删除的批次主键
     * @return 结果
     */
    @Override
    public int deleteBatchByIds(Long[] ids)
    {
        return batchMapper.deleteBatchByIds(ids);
    }

    /**
     * 删除批次信息
     * 
     * @param id 批次主键
     * @return 结果
     */
    @Override
    public int deleteBatchById(Long id)
    {
        return batchMapper.deleteBatchById(id);
    }
}
