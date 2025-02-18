package com.ruoyi.medicine.service;

import java.util.List;
import com.ruoyi.medicine.domain.StockThreshold;

/**
 * 药品存量阈值Service接口
 * 
 * @author ruoyi
 * @date 2025-02-18
 */
public interface IStockThresholdService 
{
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
     * 批量删除药品存量阈值
     * 
     * @param ids 需要删除的药品存量阈值主键集合
     * @return 结果
     */
    public int deleteStockThresholdByIds(Long[] ids);

    /**
     * 删除药品存量阈值信息
     * 
     * @param id 药品存量阈值主键
     * @return 结果
     */
    public int deleteStockThresholdById(Long id);
}
