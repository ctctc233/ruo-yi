package com.ruoyi.medicine.mapper;

import java.util.List;
import com.ruoyi.medicine.domain.StockThreshold;

/**
 * 药品存量阈值Mapper接口
 * 
 * @author ruoyi
 * @date 2025-02-18
 */
public interface StockThresholdMapper 
{
    List<StockThreshold> queryAll();
    /**
     * 查询药品存量阈值
     * 
     * @param id 药品存量阈值主键
     * @return 药品存量阈值
     */
    public StockThreshold selectStockThresholdById(Long id);

    /**
     * 查询药品存量阈值列表
     * 
     * @param stockThreshold 药品存量阈值
     * @return 药品存量阈值集合
     */
    public List<StockThreshold> selectStockThresholdList(StockThreshold stockThreshold);

    /**
     * 新增药品存量阈值
     * 
     * @param stockThreshold 药品存量阈值
     * @return 结果
     */
    public int insertStockThreshold(StockThreshold stockThreshold);

    /**
     * 修改药品存量阈值
     * 
     * @param stockThreshold 药品存量阈值
     * @return 结果
     */
    public int updateStockThreshold(StockThreshold stockThreshold);

    /**
     * 删除药品存量阈值
     * 
     * @param id 药品存量阈值主键
     * @return 结果
     */
    public int deleteStockThresholdById(Long id);

    /**
     * 批量删除药品存量阈值
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteStockThresholdByIds(Long[] ids);
}
