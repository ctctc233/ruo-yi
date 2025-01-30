package com.ruoyi.medicine.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;

import java.util.Date;

public class MedicinePro {
    /** 药品id */
    private Long id;

    /** 批号 */
    private String batchNumber;

    /** 名字 */
    private String name;

    /** 编号 */
    private Long number;

    /** 品牌 */
    private String brand;

    /** 关联规格表 */
    /** 规格键 */
    private String specificationAttributekey;

    /** 规格值 */
    private String specificationAttributename;

    /** 生产时间 */
    private Date productionDate;

    /** 过期时间 */
    private Date expiryDate;

    /** 厂商 */
    private String manufacturer;

    /** 单位 */
    private String unit;

    /** 数量 */
    private Long count;

    /** 0：正常；1：停用 */
    private Long status;

    public MedicinePro(Long id, String batchNumber, String name, Long number, String brand, String specificationAttributekey, String specificationAttributename, Date productionDate, Date expiryDate, String manufacturer, String unit, Long count, Long status) {
        this.id = id;
        this.batchNumber = batchNumber;
        this.name = name;
        this.number = number;
        this.brand = brand;
        this.specificationAttributekey = specificationAttributekey;
        this.specificationAttributename = specificationAttributename;
        this.productionDate = productionDate;
        this.expiryDate = expiryDate;
        this.manufacturer = manufacturer;
        this.unit = unit;
        this.count = count;
        this.status = status;
    }

    public MedicinePro() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBatchNumber() {
        return batchNumber;
    }

    public void setBatchNumber(String batchNumber) {
        this.batchNumber = batchNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getNumber() {
        return number;
    }

    public void setNumber(Long number) {
        this.number = number;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getSpecificationAttributekey() {
        return specificationAttributekey;
    }

    public void setSpecificationAttributekey(String specificationAttributekey) {
        this.specificationAttributekey = specificationAttributekey;
    }

    public String getSpecificationAttributename() {
        return specificationAttributename;
    }

    public void setSpecificationAttributename(String specificationAttributename) {
        this.specificationAttributename = specificationAttributename;
    }

    public Date getProductionDate() {
        return productionDate;
    }

    public void setProductionDate(Date productionDate) {
        this.productionDate = productionDate;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "MedicinePro{" +
                "id=" + id +
                ", batchNumber='" + batchNumber + '\'' +
                ", name='" + name + '\'' +
                ", number=" + number +
                ", brand='" + brand + '\'' +
                ", specificationAttributekey='" + specificationAttributekey + '\'' +
                ", specificationAttributename='" + specificationAttributename + '\'' +
                ", productionDate=" + productionDate +
                ", expiryDate=" + expiryDate +
                ", manufacturer='" + manufacturer + '\'' +
                ", unit='" + unit + '\'' +
                ", count=" + count +
                ", status=" + status +
                '}';
    }
}
