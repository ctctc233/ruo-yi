package com.ruoyi.medicine.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 药品-批次-关联表对象 medicine_batch
 * 
 * @author ruoyi
 * @date 2025-01-26
 */
public class MedicineBatch extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 关联id */
    private Long id;

    /** 药品id */
    @Excel(name = "药品id")
    private Long medicineId;

    /** 批次id */
    @Excel(name = "批次id")
    private Long batchId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setMedicineId(Long medicineId) 
    {
        this.medicineId = medicineId;
    }

    public Long getMedicineId() 
    {
        return medicineId;
    }
    public void setBatchId(Long batchId) 
    {
        this.batchId = batchId;
    }

    public Long getBatchId() 
    {
        return batchId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("medicineId", getMedicineId())
            .append("batchId", getBatchId())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
