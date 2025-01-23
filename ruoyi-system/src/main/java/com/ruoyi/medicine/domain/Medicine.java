package com.ruoyi.medicine.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 药品对象 medicine
 * 
 * @author ruoyi
 * @date 2025-01-24
 */
public class Medicine extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 药品ID */
    private Long id;

    /** 药品名称 */
    @Excel(name = "药品名称")
    private String name;

    /** 编号 */
    @Excel(name = "编号")
    private Long number;

    /** 品牌 */
    @Excel(name = "品牌")
    private String brand;

    /** 关联规格表 */
    @Excel(name = "关联规格表")
    private Long specificationAttributeId;

    /** 生产日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "生产日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date productionDate;

    /** 过期日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "过期日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date expiryDate;

    /** 厂商 */
    @Excel(name = "厂商")
    private String manufacturer;

    /** 单位 */
    @Excel(name = "单位")
    private String unit;

    /** 0：正常；1：停用 */
    @Excel(name = "0：正常；1：停用")
    private Long status;

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
    public void setNumber(Long number) 
    {
        this.number = number;
    }

    public Long getNumber() 
    {
        return number;
    }
    public void setBrand(String brand) 
    {
        this.brand = brand;
    }

    public String getBrand() 
    {
        return brand;
    }
    public void setSpecificationAttributeId(Long specificationAttributeId) 
    {
        this.specificationAttributeId = specificationAttributeId;
    }

    public Long getSpecificationAttributeId() 
    {
        return specificationAttributeId;
    }
    public void setProductionDate(Date productionDate) 
    {
        this.productionDate = productionDate;
    }

    public Date getProductionDate() 
    {
        return productionDate;
    }
    public void setExpiryDate(Date expiryDate) 
    {
        this.expiryDate = expiryDate;
    }

    public Date getExpiryDate() 
    {
        return expiryDate;
    }
    public void setManufacturer(String manufacturer) 
    {
        this.manufacturer = manufacturer;
    }

    public String getManufacturer() 
    {
        return manufacturer;
    }
    public void setUnit(String unit) 
    {
        this.unit = unit;
    }

    public String getUnit() 
    {
        return unit;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("number", getNumber())
            .append("brand", getBrand())
            .append("specificationAttributeId", getSpecificationAttributeId())
            .append("productionDate", getProductionDate())
            .append("expiryDate", getExpiryDate())
            .append("manufacturer", getManufacturer())
            .append("unit", getUnit())
            .append("status", getStatus())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
