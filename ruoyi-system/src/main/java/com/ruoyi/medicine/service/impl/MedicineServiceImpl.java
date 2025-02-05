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
	public List<MedicinePro> selectMedicineList(MedicinePro medicine) {
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
		medicinePro.setCreateTime(DateUtils.getNowDate());
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
	 * @param medicinePro 药品
	 * @return 结果
	 */
	@Override
	public int updateMedicine(MedicinePro medicinePro) {
		// TODO 药品修改关联表，药品库存，药品规格,药品批号
		/*修改规格*/
		Specificationattribute specificationattribute = new Specificationattribute();
		specificationattribute.setAttributeKey(medicinePro.getSpecificationAttributekey());
		specificationattribute.setAttributeValue(medicinePro.getSpecificationAttributename());
		specificationattributeMapper.updateSpecificationattribute(specificationattribute);


		/*修改药品*/
		Medicine medicine = new Medicine();
		medicine.setName(medicinePro.getName());
		medicine.setNumber(medicinePro.getNumber());
		medicine.setBrand(medicinePro.getBrand());
		// 修改药品不需要修改规格关联id
//		medicine.setSpecificationAttributeId(specificationattribute.getId());
		medicine.setProductionDate(medicinePro.getProductionDate());
		medicine.setExpiryDate(medicinePro.getExpiryDate());
		medicine.setManufacturer(medicinePro.getManufacturer());
		medicine.setUnit(medicinePro.getUnit());
		medicine.setCount(medicinePro.getCount());
		medicine.setUpdateTime(DateUtils.getNowDate());
		medicineMapper.updateMedicine(medicine);

		/*修改批号*/
		MedicineBatch medicineBatch = new MedicineBatch();
		medicineBatch.setBatchId(batchMapper.selectBatchByBatchNumber(medicinePro.getBatchNumber()));
		medicineBatchMapper.updateMedicineBatch(medicineBatch);

		/*修改库存*/
		Medicinestorage medicinestorage = new Medicinestorage();
		medicinestorage.setStorageEnvId(storageenvironmentMapper.selectStorageEnvironmentId(medicinePro.getLocation()));
		medicinestorageMapper.updateMedicinestorage(medicinestorage);
		return 1;
	}

	/**
	 * 批量删除药品
	 *
	 * @param ids 需要删除的药品主键
	 * @return 结果
	 */
	@Override
	public int deleteMedicineByIds(Long[] ids) {
		medicinestorageMapper.deleteMedicinestorageByMedIds(ids);
		// 删除规格，具体实现待定（这里传参是错误的）
		//specificationattributeMapper.deleteSpecificationattributeByIds(ids);
		medicineMapper.deleteMedicineByIds(ids);
		return 1;
	}

	/**
	 * 删除药品信息
	 *
	 * @param id 药品主键
	 * @return 结果
	 */
	@Override
	public int deleteMedicineById(Long id) {
		// TODO 药品删除关联表，药品库存，药品规格
		medicineMapper.deleteMedicineById(id);
		return 1;
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
