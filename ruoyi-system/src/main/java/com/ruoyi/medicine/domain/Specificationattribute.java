package com.ruoyi.medicine.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 药品规格对象 specificationattribute
 * 
 * @author ruoyi
 * @date 2025-01-24
 */
public class Specificationattribute extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 规格id */
    private Long id;

    /** 规格键 */
    @Excel(name = "规格键")
    private String attributeKey;

    /** 规格值 */
    @Excel(name = "规格值")
    private String attributeValue;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setAttributeKey(String attributeKey) 
    {
        this.attributeKey = attributeKey;
    }

    public String getAttributeKey() 
    {
        return attributeKey;
    }
    public void setAttributeValue(String attributeValue) 
    {
        this.attributeValue = attributeValue;
    }

    public String getAttributeValue() 
    {
        return attributeValue;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("attributeKey", getAttributeKey())
            .append("attributeValue", getAttributeValue())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
