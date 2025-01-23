package com.ruoyi.medicine.mapper;

import java.util.List;
import com.ruoyi.medicine.domain.Batch;

/**
 * 批次Mapper接口
 * 
 * @author ruoyi
 * @date 2025-01-24
 */
public interface BatchMapper 
{
    /**
     * 查询批次
     * 
     * @param id 批次主键
     * @return 批次
     */
    public Batch selectBatchById(Long id);

    /**
     * 查询批次列表
     * 
     * @param batch 批次
     * @return 批次集合
     */
    public List<Batch> selectBatchList(Batch batch);

    /**
     * 新增批次
     * 
     * @param batch 批次
     * @return 结果
     */
    public int insertBatch(Batch batch);

    /**
     * 修改批次
     * 
     * @param batch 批次
     * @return 结果
     */
    public int updateBatch(Batch batch);

    /**
     * 删除批次
     * 
     * @param id 批次主键
     * @return 结果
     */
    public int deleteBatchById(Long id);

    /**
     * 批量删除批次
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBatchByIds(Long[] ids);
}
