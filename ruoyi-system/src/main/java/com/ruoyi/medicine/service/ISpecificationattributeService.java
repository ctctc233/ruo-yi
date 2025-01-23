package com.ruoyi.medicine.service;

import java.util.List;
import com.ruoyi.medicine.domain.Specificationattribute;

/**
 * 药品规格Service接口
 * 
 * @author ruoyi
 * @date 2025-01-24
 */
public interface ISpecificationattributeService 
{
    /**
     * 查询药品规格
     * 
     * @param id 药品规格主键
     * @return 药品规格
     */
    public Specificationattribute selectSpecificationattributeById(Long id);

    /**
     * 查询药品规格列表
     * 
     * @param specificationattribute 药品规格
     * @return 药品规格集合
     */
    public List<Specificationattribute> selectSpecificationattributeList(Specificationattribute specificationattribute);

    /**
     * 新增药品规格
     * 
     * @param specificationattribute 药品规格
     * @return 结果
     */
    public int insertSpecificationattribute(Specificationattribute specificationattribute);

    /**
     * 修改药品规格
     * 
     * @param specificationattribute 药品规格
     * @return 结果
     */
    public int updateSpecificationattribute(Specificationattribute specificationattribute);

    /**
     * 批量删除药品规格
     * 
     * @param ids 需要删除的药品规格主键集合
     * @return 结果
     */
    public int deleteSpecificationattributeByIds(Long[] ids);

    /**
     * 删除药品规格信息
     * 
     * @param id 药品规格主键
     * @return 结果
     */
    public int deleteSpecificationattributeById(Long id);
}
