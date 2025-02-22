package com.ruoyi.medicine.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;

import java.util.Date;

/*
* 临期药品
* */
public class MedicineExpirationApproaching {
    // 药品ID
    private Long medicineId;

    // 药品名称
    private String medicineName;

    // 药品批次号
    private String batchNumber;

    // 药品生产厂商
    private String manufacturer;

    // 地点
    @Excel(name = "地点")
    private String location;

//    // 温度
//    @Excel(name = "温度")
//    private String temperature;

    /** 规格键 */
    @Excel(name = "规格键")
    private String attributeKey;

    /** 规格值 */
    @Excel(name = "规格值")
    private String attributeValue;

    // 药品生产日期
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date productionDate;

    // 药品有效期至
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date expirationDate;

    // 临期阈值（例如，提前多少天算临期）
    private Integer expirationThresholdDays;

    // 是否已标记为临期（根据阈值判断）
    private Boolean isApproachingExpiration;

    //剩余天数
    private long days;


    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

//    public String getTemperature() {
//        return temperature;
//    }
//
//    public void setTemperature(String temperature) {
//        this.temperature = temperature;
//    }

    public String getAttributeKey() {
        return attributeKey;
    }

    public void setAttributeKey(String attributeKey) {
        this.attributeKey = attributeKey;
    }

    public String getAttributeValue() {
        return attributeValue;
    }

    public void setAttributeValue(String attributeValue) {
        this.attributeValue = attributeValue;
    }

    public long getDays() {
        return days;
    }

    public void setDays(long days) {
        this.days = days;
    }

    public Long getMedicineId() {
        return medicineId;
    }

    public void setMedicineId(Long medicineId) {
        this.medicineId = medicineId;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    public String getBatchNumber() {
        return batchNumber;
    }

    public void setBatchNumber(String batchNumber) {
        this.batchNumber = batchNumber;
    }

    public Date getProductionDate() {
        return productionDate;
    }

    public void setProductionDate(Date productionDate) {
        this.productionDate = productionDate;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }

    public Integer getExpirationThresholdDays() {
        return expirationThresholdDays;
    }

    public void setExpirationThresholdDays(Integer expirationThresholdDays) {
        this.expirationThresholdDays = expirationThresholdDays;
    }

    public Boolean getApproachingExpiration() {
        return isApproachingExpiration;
    }

    public void setApproachingExpiration(Boolean approachingExpiration) {
        isApproachingExpiration = approachingExpiration;
    }

    @Override
    public String toString() {
        return "MedicineExpirationApproaching{" +
                "medicineId=" + medicineId +
                ", medicineName='" + medicineName + '\'' +
                ", batchNumber='" + batchNumber + '\'' +
                ", manufacturer='" + manufacturer + '\'' +
                ", location='" + location + '\'' +
//                ", temperature='" + temperature + '\'' +
                ", attributeKey='" + attributeKey + '\'' +
                ", attributeValue='" + attributeValue + '\'' +
                ", productionDate=" + productionDate +
                ", expirationDate=" + expirationDate +
                ", expirationThresholdDays=" + expirationThresholdDays +
                ", isApproachingExpiration=" + isApproachingExpiration +
                ", days=" + days +
                '}';
    }
}
