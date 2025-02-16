package com.ruoyi.medicine.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

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

    public MedicineExpirationApproaching(Long medicineId, String medicineName, String batchNumber, Date productionDate, Date expirationDate, Integer expirationThresholdDays, Boolean isApproachingExpiration, long days) {
        this.medicineId = medicineId;
        this.medicineName = medicineName;
        this.batchNumber = batchNumber;
        this.productionDate = productionDate;
        this.expirationDate = expirationDate;
        this.expirationThresholdDays = expirationThresholdDays;
        this.isApproachingExpiration = isApproachingExpiration;
        this.days = days;
    }

    public MedicineExpirationApproaching() {
    }

    @Override
    public String toString() {
        return "MedicineExpirationApproaching{" +
                "medicineId=" + medicineId +
                ", medicineName='" + medicineName + '\'' +
                ", batchNumber='" + batchNumber + '\'' +
                ", productionDate=" + productionDate +
                ", expirationDate=" + expirationDate +
                ", expirationThresholdDays=" + expirationThresholdDays +
                ", isApproachingExpiration=" + isApproachingExpiration +
                ", days=" + days +
                '}';
    }
}
