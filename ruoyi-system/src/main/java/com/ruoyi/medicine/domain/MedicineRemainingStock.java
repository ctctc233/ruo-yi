package com.ruoyi.medicine.domain;

public class MedicineRemainingStock {
    //药品名字
    String name;

    //存量
    long count;

    //阈值
    int threshold;

    //是否存量不足
    Boolean flag;

    @Override
    public String toString() {
        return "MedicineRemainingStock{" +
                "name='" + name + '\'' +
                ", count=" + count +
                ", threshold=" + threshold +
                ", flag=" + flag +
                '}';
    }

    public MedicineRemainingStock(String name, long count, int threshold, boolean flag) {
        this.name = name;
        this.count = count;
        this.threshold = threshold;
        this.flag = flag;
    }

    public MedicineRemainingStock() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }

    public int getThreshold() {
        return threshold;
    }

    public void setThreshold(int threshold) {
        this.threshold = threshold;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }
}
