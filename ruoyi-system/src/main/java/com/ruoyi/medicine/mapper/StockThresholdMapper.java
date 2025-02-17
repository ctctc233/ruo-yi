package com.ruoyi.medicine.mapper;

import com.ruoyi.medicine.domain.StockThreshold;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;
import java.util.List;


/**
 * 药品阈值表(StockThreshold)表数据库访问层
 *
 * @author makejava
 * @since 2025-02-17 22:07:37
 */
public interface StockThresholdMapper {

    List<StockThreshold> queryAll();

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    StockThreshold queryById(Integer id);

    /**
     * 查询指定行数据
     *
     * @param stockThreshold 查询条件
     * @param pageable         分页对象
     * @return 对象列表
     */
    List<StockThreshold> queryAllByLimit(StockThreshold stockThreshold, @Param("pageable") Pageable pageable);

    /**
     * 统计总行数
     *
     * @param stockThreshold 查询条件
     * @return 总行数
     */
    long count(StockThreshold stockThreshold);

    /**
     * 新增数据
     *
     * @param stockThreshold 实例对象
     * @return 影响行数
     */
    int insert(StockThreshold stockThreshold);

    /**
     * 批量新增数据（MyBatis原生foreach方法）
     *
     * @param entities List<StockThreshold> 实例对象列表
     * @return 影响行数
     */
    int insertBatch(@Param("entities") List<StockThreshold> entities);

    /**
     * 批量新增或按主键更新数据（MyBatis原生foreach方法）
     *
     * @param entities List<StockThreshold> 实例对象列表
     * @return 影响行数
     * @throws org.springframework.jdbc.BadSqlGrammarException 入参是空List的时候会抛SQL语句错误的异常，请自行校验入参
     */
    int insertOrUpdateBatch(@Param("entities") List<StockThreshold> entities);

    /**
     * 修改数据
     *
     * @param stockThreshold 实例对象
     * @return 影响行数
     */
    int update(StockThreshold stockThreshold);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Integer id);

}

