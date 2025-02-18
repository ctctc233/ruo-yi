package com.ruoyi.web.controller.medicine;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.medicine.domain.StockThreshold;
import com.ruoyi.medicine.service.IStockThresholdService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 药品存量阈值Controller
 * 
 * @author ruoyi
 * @date 2025-02-18
 */
@RestController
@RequestMapping("/medicine/threshold")
public class StockThresholdController extends BaseController
{
    @Autowired
    private IStockThresholdService stockThresholdService;

    /**
     * 查询药品存量阈值列表
     */
    @PreAuthorize("@ss.hasPermi('medicine:threshold:list')")
    @GetMapping("/list")
    public TableDataInfo list(StockThreshold stockThreshold)
    {
        startPage();
        List<StockThreshold> list = stockThresholdService.selectStockThresholdList(stockThreshold);
        return getDataTable(list);
    }

    /**
     * 导出药品存量阈值列表
     */
    @PreAuthorize("@ss.hasPermi('medicine:threshold:export')")
    @Log(title = "药品存量阈值", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, StockThreshold stockThreshold)
    {
        List<StockThreshold> list = stockThresholdService.selectStockThresholdList(stockThreshold);
        ExcelUtil<StockThreshold> util = new ExcelUtil<StockThreshold>(StockThreshold.class);
        util.exportExcel(response, list, "药品存量阈值数据");
    }

    /**
     * 获取药品存量阈值详细信息
     */
    @PreAuthorize("@ss.hasPermi('medicine:threshold:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(stockThresholdService.selectStockThresholdById(id));
    }

    /**
     * 新增药品存量阈值
     */
    @PreAuthorize("@ss.hasPermi('medicine:threshold:add')")
    @Log(title = "药品存量阈值", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody StockThreshold stockThreshold)
    {
        return toAjax(stockThresholdService.insertStockThreshold(stockThreshold));
    }

    /**
     * 修改药品存量阈值
     */
    @PreAuthorize("@ss.hasPermi('medicine:threshold:edit')")
    @Log(title = "药品存量阈值", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody StockThreshold stockThreshold)
    {
        return toAjax(stockThresholdService.updateStockThreshold(stockThreshold));
    }

    /**
     * 删除药品存量阈值
     */
    @PreAuthorize("@ss.hasPermi('medicine:threshold:remove')")
    @Log(title = "药品存量阈值", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(stockThresholdService.deleteStockThresholdByIds(ids));
    }
}
