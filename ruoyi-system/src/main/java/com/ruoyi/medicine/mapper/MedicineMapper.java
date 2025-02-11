package com.ruoyi.medicine.mapper;

import java.util.List;
import com.ruoyi.medicine.domain.Medicine;
import com.ruoyi.medicine.domain.MedicinePro;
import org.apache.ibatis.annotations.Param;

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
    public MedicinePro selectMedicineById(Long id);

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
    public List<MedicinePro> selectMedicineList(MedicinePro medicine);

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
     * 药品出库
     *
     * @param name 药品主键\出库数量\库位
     * @return 结果
     */
    int outMedicine(@Param("name") String name, @Param("count") Long count, @Param("location") String location);


    /**
     * 药品出库
     *
     * @param name 药品主键\出库数量\库位
     * @return 结果
     */
    public List<MedicinePro> outMedicineDetail(String name, String location);

    /**
     * 药品库存查询
     *
     * @param name 药品主键\出库数量\库位
     * @return 结果
     */
    public Long selectMedicineStock(String name, String location);

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

    /**
     * 统计药品详情
     *
     * @return 结果
     */
    public List<MedicinePro> selectMedicineDetail(Long number);
}
