package com.ruoyi.medicine.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.medicine.domain.*;
import com.ruoyi.medicine.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.medicine.service.IMedicineService;

/**
 * 药品Service业务层处理
 *
 * @author ruoyi
 * @date 2025-01-24
 */
@Service
public class MedicineServiceImpl implements IMedicineService {
	@Autowired
	private MedicineMapper medicineMapper;
	@Autowired
	private BatchMapper batchMapper;
	@Autowired
	private SpecificationattributeMapper specificationattributeMapper;
	@Autowired
	private StorageEnvironmentMapper storageenvironmentMapper;

	@Autowired
	private MedicineBatchMapper medicineBatchMapper;
	@Autowired
	private MedicinestorageMapper medicinestorageMapper;

	/**
	 * 查询药品
	 *
	 * @param id 药品主键
	 * @return 药品
	 */
	@Override
	public Medicine selectMedicineById(Long id) {
		return medicineMapper.selectMedicineById(id);
	}

	/**
	 * 查询药品列表
	 *
	 * @param medicine 药品
	 * @return 药品
	 */
	@Override
	public List<Medicine> selectMedicineList(Medicine medicine) {
		return medicineMapper.selectMedicineList(medicine);
	}

	/**
	 * 新增药品
	 *
	 * @param medicinePro 药品
	 * @return 结果
	 */
	@Override
	public int insertMedicine(MedicinePro medicinePro) {
//		medicine.setCreateTime(DateUtils.getNowDate());
//		return medicineMapper.insertMedicine(medicine);

		/*插入规格*/
		Specificationattribute specificationattribute = new Specificationattribute();
		specificationattribute.setAttributeKey(medicinePro.getSpecificationAttributekey());
		specificationattribute.setAttributeValue(medicinePro.getSpecificationAttributename());
		specificationattributeMapper.insertSpecificationattribute(specificationattribute);

		/*插入药品*/
		Medicine medicine = new Medicine();
		medicine.setName(medicinePro.getName());
		medicine.setNumber(medicinePro.getNumber());
		medicine.setBrand(medicinePro.getBrand());
		medicine.setSpecificationAttributeId(specificationattribute.getId());
		medicine.setProductionDate(medicinePro.getProductionDate());
		medicine.setExpiryDate(medicinePro.getExpiryDate());
		medicine.setManufacturer(medicinePro.getManufacturer());
		medicine.setUnit(medicinePro.getUnit());
		medicine.setCount(medicinePro.getCount());
		medicineMapper.insertMedicine(medicine);

		/*插入批号*/
		MedicineBatch medicineBatch = new MedicineBatch();
		medicineBatch.setBatchId(batchMapper.selectBatchByBatchNumber(medicinePro.getBatchNumber()));
		medicineBatch.setMedicineId(medicine.getId());
		medicineBatchMapper.insertMedicineBatch(medicineBatch);

		/*插入库存*/
		Medicinestorage medicinestorage = new Medicinestorage();
		medicinestorage.setMedicineId(medicine.getId());
		medicinestorage.setStorageEnvId(storageenvironmentMapper.selectStorageEnvironmentId(medicinePro.getLocation()));
		medicinestorageMapper.insertMedicinestorage(medicinestorage);
		return 1;
	}

	/**
	 * 修改药品
	 *
	 * @param medicine 药品
	 * @return 结果
	 */
	@Override
	public int updateMedicine(Medicine medicine) {
		medicine.setUpdateTime(DateUtils.getNowDate());
		return medicineMapper.updateMedicine(medicine);
	}

	/**
	 * 批量删除药品
	 *
	 * @param ids 需要删除的药品主键
	 * @return 结果
	 */
	@Override
	public int deleteMedicineByIds(Long[] ids) {
		return medicineMapper.deleteMedicineByIds(ids);
	}

	/**
	 * 删除药品信息
	 *
	 * @param id 药品主键
	 * @return 结果
	 */
	@Override
	public int deleteMedicineById(Long id) {
		return medicineMapper.deleteMedicineById(id);
	}

	/**
	 * 查询过期药品信息
	 *
	 * @return 结果
	 */
	@Override
	public List<Medicine> selectExpiredMedicine() {
		return medicineMapper.selectMedicineByExpired();
	}
}
