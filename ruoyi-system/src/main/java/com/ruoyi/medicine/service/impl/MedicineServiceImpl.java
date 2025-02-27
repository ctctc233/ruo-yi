package com.ruoyi.medicine.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.medicine.domain.*;
import com.ruoyi.medicine.mapper.*;
import com.ruoyi.medicine.service.IMedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

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

	@Autowired
	private StockThresholdMapper stockThresholdMapper;

	/**
	 * 查询药品
	 *
	 * @param id 药品主键
	 * @return 药品
	 */
	@Override
	public MedicinePro selectMedicineById(Long id) {
		System.out.println("药品id:" + id);
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
	 * 查询/处理药品临期列表
	 *
	 * @param medicine 药品
	 * @return 药品
	 */
	@Override
	public List<MedicineExpirationApproaching> selectNearExpirationMedicineslist(MedicinePro medicine) {
		List<MedicinePro> medicinePros = medicineMapper.selectMedicineList(medicine);
		for (MedicinePro medicinePro : medicinePros) {
			System.out.println(medicinePro);
		}
		List<MedicineExpirationApproaching> medicineExpirationApproachings = new ArrayList<>();
		for (MedicinePro medicinePro : medicinePros) {
			MedicineExpirationApproaching medicineExpirationApproaching = new MedicineExpirationApproaching();

			medicineExpirationApproaching.setMedicineId(medicinePro.getId());
			medicineExpirationApproaching.setMedicineName(medicinePro.getName());
			medicineExpirationApproaching.setBatchNumber(medicinePro.getBatchNumber());
			medicineExpirationApproaching.setManufacturer(medicinePro.getManufacturer());
			medicineExpirationApproaching.setProductionDate(medicinePro.getProductionDate());
			medicineExpirationApproaching.setExpirationDate(medicinePro.getExpiryDate());
			medicineExpirationApproaching.setLocation(medicinePro.getLocation());
			medicineExpirationApproaching.setAttributeKey(medicinePro.getSpecificationAttributekey());
			medicineExpirationApproaching.setAttributeValue(medicinePro.getSpecificationAttributename());

			/* 默认90天临期天数 */
			medicineExpirationApproaching.setExpirationThresholdDays(90);

			LocalDate currentDate = LocalDate.now();
			try {
				LocalDate date = medicineExpirationApproaching.getExpirationDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
				System.out.println(medicineExpirationApproaching.getExpirationDate());
				long days = ChronoUnit.DAYS.between(currentDate, date);
				if (days < 0) {
					days = -1;
				}
				medicineExpirationApproaching.setDays(days);
				medicineExpirationApproaching.setApproachingExpiration(days <= medicineExpirationApproaching.getExpirationThresholdDays());
			} catch (Exception e) {
				medicineExpirationApproaching.setApproachingExpiration(null);
				medicineExpirationApproaching.setDays(0);
			}

			medicineExpirationApproachings.add(medicineExpirationApproaching);
		}
		return medicineExpirationApproachings;
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

		/*插入药品阈值表*/
		/*入库时，统一设计阈值为20*/
		StockThreshold stockThreshold = new StockThreshold();
		stockThreshold.setName(medicine.getName());
		stockThreshold.setThreshold(20L);
		try {
			stockThresholdMapper.insertStockThreshold(stockThreshold);
		} catch (Exception e) {
			return 1;
		}
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
		System.out.println("药品修改" + medicinePro);
		// TODO 药品修改关联表，药品库存，药品规格,药品批号
		System.out.println("药品修改" + medicinePro.getId());
		/*修改规格*/
		Specificationattribute specificationattribute = new Specificationattribute();
		specificationattribute.setId(medicinePro.getSpecificationAttributeId());
		specificationattribute.setAttributeKey(medicinePro.getSpecificationAttributekey());
		specificationattribute.setAttributeValue(medicinePro.getSpecificationAttributename());
		specificationattributeMapper.updateSpecificationattribute(specificationattribute);

		/*修改药品*/
		Medicine medicine = new Medicine();
		medicine.setId(medicinePro.getId());
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
		medicineBatch.setMedicineId(medicine.getId());
		medicineBatch.setBatchId(batchMapper.selectBatchByBatchNumber(medicinePro.getBatchNumber()));
		medicineBatchMapper.updateMedicineBatch(medicineBatch);

		/*修改库存*/
		Medicinestorage medicinestorage = new Medicinestorage();
		medicinestorage.setMedicineId(medicine.getId());
		medicinestorage.setStorageEnvId(storageenvironmentMapper.selectStorageEnvironmentId(medicinePro.getLocation()));
		medicinestorageMapper.updateMedicinestorage(medicinestorage);
		return 1;
	}

	/**
	 * 药品出库
	 *
	 * @return 结果
	 */
	@Override
	public int outMedicine(String name, Long count, String location) {
		List<MedicinePro> medicinePros = outMedicineDetail(name, location);
		Long remaining = count;
		for (MedicinePro medicinePro : medicinePros) {
			// 计算完毕，退出循环
			if (remaining <= 0)
				break;

			// 计算出库数量
			Long outNum = medicinePro.getCount() > remaining ? remaining : medicinePro.getCount();
			Medicine medicine = new Medicine();
			medicine.setId(medicinePro.getId());
			medicine.setCount(medicinePro.getCount() - outNum);
			remaining -= outNum;

			// 更新药品库存
			medicine.setUpdateTime(DateUtils.getNowDate());
			medicineMapper.updateMedicine(medicine);
		}
		return 1;
	}

	/**
	 * 药品出库查询
	 *
	 * @return 结果
	 */
	@Override
	public List<MedicinePro> outMedicineDetail(String name, String location) {
		return medicineMapper.outMedicineDetail(name, location);
	}

	/**
	 * 药品库存查询
	 *
	 * @return 结果
	 */
	@Override
	public int selectMedicineStock(String name, String location) {
		return medicineMapper.selectMedicineStock(name, location);
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
		medicineBatchMapper.deleteMedicineBatchByMedIds(ids);
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

	/**
	 * 查询药品详情
	 *
	 * @return 结果
	 */
	@Override
	public List<MedicinePro> selectMedicineDetail(Long number) {
		return medicineMapper.selectMedicineDetail(number);
	}

	/**
	 * 药品存量列表
	 *
	 * @return 结果
	 */

	@Override
	public List<MedicineRemainingStock> listRemainingStockMedicine(){
		List<MedicineRemainingStock> medicineRemainingStocks = medicineMapper.listRemainingStockMedicine();
		List<StockThreshold> stockThresholds = stockThresholdMapper.queryAll();
		for (StockThreshold stockThreshold : stockThresholds) {
			for (MedicineRemainingStock medicineRemainingStock : medicineRemainingStocks) {
				String name = stockThreshold.getName();
				try {
					if (name.equals(medicineRemainingStock.getName())) {
						long threshold = stockThreshold.getThreshold();
						medicineRemainingStock.setThreshold((int) threshold);
						medicineRemainingStock.setFlag(threshold > medicineRemainingStock.getCount());
					}
				} catch (Exception e) {
					medicineRemainingStock.setFlag(null);
				}
			}
		}
		return medicineRemainingStocks;
	}
}
