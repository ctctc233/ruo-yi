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
import com.ruoyi.medicine.domain.MedicineBatch;
import com.ruoyi.medicine.service.IMedicineBatchService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 药品-批次-关联表Controller
 * 
 * @author ruoyi
 * @date 2025-01-26
 */
@RestController
@RequestMapping("/medicine/medicinebatch")
public class MedicineBatchController extends BaseController
{
    @Autowired
    private IMedicineBatchService medicineBatchService;

    /**
     * 查询药品-批次-关联表列表
     */
    @PreAuthorize("@ss.hasPermi('medicine:medicinebatch:list')")
    @GetMapping("/list")
    public TableDataInfo list(MedicineBatch medicineBatch)
    {
        startPage();
        List<MedicineBatch> list = medicineBatchService.selectMedicineBatchList(medicineBatch);
        return getDataTable(list);
    }

    /**
     * 导出药品-批次-关联表列表
     */
    @PreAuthorize("@ss.hasPermi('medicine:medicinebatch:export')")
    @Log(title = "药品-批次-关联表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MedicineBatch medicineBatch)
    {
        List<MedicineBatch> list = medicineBatchService.selectMedicineBatchList(medicineBatch);
        ExcelUtil<MedicineBatch> util = new ExcelUtil<MedicineBatch>(MedicineBatch.class);
        util.exportExcel(response, list, "药品-批次-关联表数据");
    }

    /**
     * 获取药品-批次-关联表详细信息
     */
    @PreAuthorize("@ss.hasPermi('medicine:medicinebatch:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(medicineBatchService.selectMedicineBatchById(id));
    }

    /**
     * 新增药品-批次-关联表
     */
    @PreAuthorize("@ss.hasPermi('medicine:medicinebatch:add')")
    @Log(title = "药品-批次-关联表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MedicineBatch medicineBatch)
    {
        return toAjax(medicineBatchService.insertMedicineBatch(medicineBatch));
    }

    /**
     * 修改药品-批次-关联表
     */
    @PreAuthorize("@ss.hasPermi('medicine:medicinebatch:edit')")
    @Log(title = "药品-批次-关联表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MedicineBatch medicineBatch)
    {
        return toAjax(medicineBatchService.updateMedicineBatch(medicineBatch));
    }

    /**
     * 删除药品-批次-关联表
     */
    @PreAuthorize("@ss.hasPermi('medicine:medicinebatch:remove')")
    @Log(title = "药品-批次-关联表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(medicineBatchService.deleteMedicineBatchByIds(ids));
    }
}
