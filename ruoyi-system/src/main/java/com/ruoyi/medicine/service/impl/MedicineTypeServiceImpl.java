package com.ruoyi.medicine.service.impl;

import com.ruoyi.medicine.domain.MedicineType;
import com.ruoyi.medicine.mapper.MedicineTypeMapper;
import com.ruoyi.medicine.service.MedicineTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MedicineTypeServiceImpl implements MedicineTypeService {

    @Autowired
    private MedicineTypeMapper medicineTypeMapper;

    @Override
    public List<MedicineType> selectAllMedicines() {
        return medicineTypeMapper.selectAllMedicines(); // 调用 Mapper 方法
    }
}