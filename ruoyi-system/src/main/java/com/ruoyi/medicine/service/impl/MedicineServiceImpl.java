package com.ruoyi.medicine.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.medicine.mapper.MedicineMapper;
import com.ruoyi.medicine.domain.Medicine;
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
	 * @param medicine 药品
	 * @return 结果
	 */
	@Override
	public int insertMedicine(Medicine medicine) {
		medicine.setCreateTime(DateUtils.getNowDate());
		return medicineMapper.insertMedicine(medicine);
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
