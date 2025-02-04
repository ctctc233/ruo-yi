package com.ruoyi.medicine.service;

import java.util.List;
import com.ruoyi.medicine.domain.Medicine;
import com.ruoyi.medicine.domain.MedicinePro;

/**
 * 药品Service接口
 * 
 * @author ruoyi
 * @date 2025-01-24
 */
public interface IMedicineService 
{
    /**
     * 查询药品
     * 
     * @param id 药品主键
     * @return 药品
     */
    public Medicine selectMedicineById(Long id);

    /**
     * 查询药品列表
     * 
     * @param medicine 药品
     * @return 药品集合
     */
    public List<MedicinePro> selectMedicineList(MedicinePro medicine);

    /**
     * 新增药品
     * 
     * @param medicine 药品
     * @return 结果
     */
    public int insertMedicine(MedicinePro medicine);

    /**
     * 修改药品
     * 
     * @param medicine 药品
     * @return 结果
     */
    public int updateMedicine(Medicine medicine);

    /**
     * 批量删除药品
     * 
     * @param ids 需要删除的药品主键集合
     * @return 结果
     */
    public int deleteMedicineByIds(Long[] ids);

    /**
     * 删除药品信息
     * 
     * @param id 药品主键
     * @return 结果
     */
    public int deleteMedicineById(Long id);

    /**
     * 查询过期药品信息
     *
     * @return 结果
     */
    public List<Medicine> selectExpiredMedicine();
}
