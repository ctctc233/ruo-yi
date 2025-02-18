package com.ruoyi.medicine.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.medicine.mapper.StockThresholdMapper;
import com.ruoyi.medicine.domain.StockThreshold;
import com.ruoyi.medicine.service.IStockThresholdService;

/**
 * 药品存量阈值Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-02-18
 */
@Service
public class StockThresholdServiceImpl implements IStockThresholdService 
{
    @Autowired
    private StockThresholdMapper stockThresholdMapper;

    /**
     * 查询药品存量阈值
     * 
     * @param id 药品存量阈值主键
     * @return 药品存量阈值
     */
    @Override
    public StockThreshold selectStockThresholdById(Long id)
    {
        return stockThresholdMapper.selectStockThresholdById(id);
    }

    /**
     * 查询药品存量阈值列表
     * 
     * @param stockThreshold 药品存量阈值
     * @return 药品存量阈值
     */
    @Override
    public List<StockThreshold> selectStockThresholdList(StockThreshold stockThreshold)
    {
        return stockThresholdMapper.selectStockThresholdList(stockThreshold);
    }

    /**
     * 新增药品存量阈值
     * 
     * @param stockThreshold 药品存量阈值
     * @return 结果
     */
    @Override
    public int insertStockThreshold(StockThreshold stockThreshold)
    {
        return stockThresholdMapper.insertStockThreshold(stockThreshold);
    }

    /**
     * 修改药品存量阈值
     * 
     * @param stockThreshold 药品存量阈值
     * @return 结果
     */
    @Override
    public int updateStockThreshold(StockThreshold stockThreshold)
    {
        return stockThresholdMapper.updateStockThreshold(stockThreshold);
    }

    /**
     * 批量删除药品存量阈值
     * 
     * @param ids 需要删除的药品存量阈值主键
     * @return 结果
     */
    @Override
    public int deleteStockThresholdByIds(Long[] ids)
    {
        return stockThresholdMapper.deleteStockThresholdByIds(ids);
    }

    /**
     * 删除药品存量阈值信息
     * 
     * @param id 药品存量阈值主键
     * @return 结果
     */
    @Override
    public int deleteStockThresholdById(Long id)
    {
        return stockThresholdMapper.deleteStockThresholdById(id);
    }
}
