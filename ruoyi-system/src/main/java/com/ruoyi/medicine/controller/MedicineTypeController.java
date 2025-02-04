package com.ruoyi.medicine.controller;

import com.ruoyi.medicine.domain.MedicineType;
import com.ruoyi.medicine.service.MedicineTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")  // 可以根据需要自定义路径
public class MedicineTypeController {

    @Autowired
    private MedicineTypeService medicineTypeService;

    @GetMapping("/medicine")
    public ResponseEntity<List<MedicineType>> getAllMedicines() {
        List<MedicineType> medicineTypes = medicineTypeService.selectAllMedicines();
        if (medicineTypes != null && !medicineTypes.isEmpty()) {
            return ResponseEntity.ok(medicineTypes); // 返回 200 OK 状态
        } else {
            return ResponseEntity.noContent().build(); // 返回 204 No Content
        }
    }
}