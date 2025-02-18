package com.ruoyi.medicine.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 药品存量阈值对象 stock_threshold
 * 
 * @author ruoyi
 * @date 2025-02-18
 */
public class StockThreshold extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 药品名字 */
    @Excel(name = "药品名字")
    private String name;

    /** 存量阈值 */
    @Excel(name = "存量阈值")
    private Long threshold;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setThreshold(Long threshold) 
    {
        this.threshold = threshold;
    }

    public Long getThreshold() 
    {
        return threshold;
    }

    public StockThreshold(Long id, String name, Long threshold) {
        this.id = id;
        this.name = name;
        this.threshold = threshold;
    }

    public StockThreshold() {
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("threshold", getThreshold())
            .toString();
    }
}
