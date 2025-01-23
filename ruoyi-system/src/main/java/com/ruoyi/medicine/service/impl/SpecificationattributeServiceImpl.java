package com.ruoyi.medicine.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.medicine.mapper.SpecificationattributeMapper;
import com.ruoyi.medicine.domain.Specificationattribute;
import com.ruoyi.medicine.service.ISpecificationattributeService;

/**
 * 药品规格Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-01-24
 */
@Service
public class SpecificationattributeServiceImpl implements ISpecificationattributeService 
{
    @Autowired
    private SpecificationattributeMapper specificationattributeMapper;

    /**
     * 查询药品规格
     * 
     * @param id 药品规格主键
     * @return 药品规格
     */
    @Override
    public Specificationattribute selectSpecificationattributeById(Long id)
    {
        return specificationattributeMapper.selectSpecificationattributeById(id);
    }

    /**
     * 查询药品规格列表
     * 
     * @param specificationattribute 药品规格
     * @return 药品规格
     */
    @Override
    public List<Specificationattribute> selectSpecificationattributeList(Specificationattribute specificationattribute)
    {
        return specificationattributeMapper.selectSpecificationattributeList(specificationattribute);
    }

    /**
     * 新增药品规格
     * 
     * @param specificationattribute 药品规格
     * @return 结果
     */
    @Override
    public int insertSpecificationattribute(Specificationattribute specificationattribute)
    {
        specificationattribute.setCreateTime(DateUtils.getNowDate());
        return specificationattributeMapper.insertSpecificationattribute(specificationattribute);
    }

    /**
     * 修改药品规格
     * 
     * @param specificationattribute 药品规格
     * @return 结果
     */
    @Override
    public int updateSpecificationattribute(Specificationattribute specificationattribute)
    {
        specificationattribute.setUpdateTime(DateUtils.getNowDate());
        return specificationattributeMapper.updateSpecificationattribute(specificationattribute);
    }

    /**
     * 批量删除药品规格
     * 
     * @param ids 需要删除的药品规格主键
     * @return 结果
     */
    @Override
    public int deleteSpecificationattributeByIds(Long[] ids)
    {
        return specificationattributeMapper.deleteSpecificationattributeByIds(ids);
    }

    /**
     * 删除药品规格信息
     * 
     * @param id 药品规格主键
     * @return 结果
     */
    @Override
    public int deleteSpecificationattributeById(Long id)
    {
        return specificationattributeMapper.deleteSpecificationattributeById(id);
    }
}
