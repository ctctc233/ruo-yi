package com.ruoyi.medicine.domain;

import java.io.Serializable;

/**
 * 药品阈值表(StockThreshold)实体类
 *
 * @author makejava
 * @since 2025-02-17 22:06:42
 */
public class StockThreshold implements Serializable {
    private static final long serialVersionUID = 740952437570026377L;
    /**
     * Primary key, auto-increment
     */
    private Integer id;
    /**
     * 药品名字
     */
    private String name;
    /**
     * 阈值
     */
    private Integer threshold;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getThreshold() {
        return threshold;
    }

    public void setThreshold(Integer threshold) {
        this.threshold = threshold;
    }

}

