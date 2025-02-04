package com.ruoyi.medicine.domain;

import lombok.Data;

import java.util.Date;

@Data
public class MedicineType {
    private String number;
    private String name;
    private String brand;
    private String attribute_key;
    private Date expiry_date;
    private String manufacturer;
    private String unit;
    private int count;
    private String status;
    private String location;
    private String temperature;
}
