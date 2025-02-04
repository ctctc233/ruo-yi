package com.ruoyi.medicine.mapper;

import java.util.List;
import com.ruoyi.medicine.domain.Medicine;

/**
 * 药品Mapper接口
 * 
 * @author ruoyi
 * @date 2025-01-24
 */
public interface MedicineMapper 
{
    /**
     * 查询药品
     * 
     * @param id 药品主键
     * @return 药品
     */
    public Medicine selectMedicineById(Long id);

    /*
    * 查询药品信息
    * */

//    public Medicine selectAllMedicines();
    /**
     * 查询药品列表
     * 
     * @param medicine 药品
     * @return 药品集合
     */
    public List<Medicine> selectMedicineList(Medicine medicine);

    /**
     * 新增药品
     * 
     * @param medicine 药品
     * @return 结果
     */
    public int insertMedicine(Medicine medicine);

    /**
     * 修改药品
     * 
     * @param medicine 药品
     * @return 结果
     */
    public int updateMedicine(Medicine medicine);

    /**
     * 删除药品
     * 
     * @param id 药品主键
     * @return 结果
     */
    public int deleteMedicineById(Long id);

    /**
     * 批量删除药品
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMedicineByIds(Long[] ids);

    /**
     * 显示过期药品
     *
     * @return 结果
     */
    public List<Medicine> selectMedicineByExpired();
}
