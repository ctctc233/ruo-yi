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
import com.ruoyi.medicine.domain.Batch;
import com.ruoyi.medicine.service.IBatchService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 批次Controller
 * 
 * @author ruoyi
 * @date 2025-01-24
 */
@RestController
@RequestMapping("/medicine/batch")
public class BatchController extends BaseController
{
    @Autowired
    private IBatchService batchService;

    /**
     * 查询批次列表
     */
    @PreAuthorize("@ss.hasPermi('medicine:batch:list')")
    @GetMapping("/list")
    public TableDataInfo list(Batch batch)
    {
        startPage();
        List<Batch> list = batchService.selectBatchList(batch);
        return getDataTable(list);
    }

    /**
     * 导出批次列表
     */
    @PreAuthorize("@ss.hasPermi('medicine:batch:export')")
    @Log(title = "批次", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Batch batch)
    {
        List<Batch> list = batchService.selectBatchList(batch);
        ExcelUtil<Batch> util = new ExcelUtil<Batch>(Batch.class);
        util.exportExcel(response, list, "批次数据");
    }

    /**
     * 获取批次详细信息
     */
    @PreAuthorize("@ss.hasPermi('medicine:batch:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(batchService.selectBatchById(id));
    }

    /**
     * 新增批次
     */
    @PreAuthorize("@ss.hasPermi('medicine:batch:add')")
    @Log(title = "批次", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Batch batch)
    {
        return toAjax(batchService.insertBatch(batch));
    }

    /**
     * 修改批次
     */
    @PreAuthorize("@ss.hasPermi('medicine:batch:edit')")
    @Log(title = "批次", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Batch batch)
    {
        return toAjax(batchService.updateBatch(batch));
    }

    /**
     * 删除批次
     */
    @PreAuthorize("@ss.hasPermi('medicine:batch:remove')")
    @Log(title = "批次", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(batchService.deleteBatchByIds(ids));
    }
}
