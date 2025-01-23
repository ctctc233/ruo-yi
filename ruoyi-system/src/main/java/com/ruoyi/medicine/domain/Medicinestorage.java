package com.ruoyi.medicine.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 药品环境对象 medicinestorage
 * 
 * @author ruoyi
 * @date 2025-01-24
 */
public class Medicinestorage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 环境ID */
    private Long id;

    /** 关联药品表 */
    @Excel(name = "关联药品表")
    private Long medicineId;

    /** 关联存放环境表 */
    @Excel(name = "关联存放环境表")
    private Long storageEnvId;

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
    public void setStorageEnvId(Long storageEnvId) 
    {
        this.storageEnvId = storageEnvId;
    }

    public Long getStorageEnvId() 
    {
        return storageEnvId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("medicineId", getMedicineId())
            .append("storageEnvId", getStorageEnvId())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
