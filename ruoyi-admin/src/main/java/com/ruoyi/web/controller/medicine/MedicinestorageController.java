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
import com.ruoyi.medicine.domain.Medicinestorage;
import com.ruoyi.medicine.service.IMedicinestorageService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 药品环境Controller
 * 
 * @author ruoyi
 * @date 2025-01-24
 */
@RestController
@RequestMapping("/medicine/medicinestorage")
public class MedicinestorageController extends BaseController
{
    @Autowired
    private IMedicinestorageService medicinestorageService;

    /**
     * 查询药品环境列表
     */
    @PreAuthorize("@ss.hasPermi('medicine:medicinestorage:list')")
    @GetMapping("/list")
    public TableDataInfo list(Medicinestorage medicinestorage)
    {
        startPage();
        List<Medicinestorage> list = medicinestorageService.selectMedicinestorageList(medicinestorage);
        return getDataTable(list);
    }

    /**
     * 导出药品环境列表
     */
    @PreAuthorize("@ss.hasPermi('medicine:medicinestorage:export')")
    @Log(title = "药品环境", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Medicinestorage medicinestorage)
    {
        List<Medicinestorage> list = medicinestorageService.selectMedicinestorageList(medicinestorage);
        ExcelUtil<Medicinestorage> util = new ExcelUtil<Medicinestorage>(Medicinestorage.class);
        util.exportExcel(response, list, "药品环境数据");
    }

    /**
     * 获取药品环境详细信息
     */
    @PreAuthorize("@ss.hasPermi('medicine:medicinestorage:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(medicinestorageService.selectMedicinestorageById(id));
    }

    /**
     * 新增药品环境
     */
    @PreAuthorize("@ss.hasPermi('medicine:medicinestorage:add')")
    @Log(title = "药品环境", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Medicinestorage medicinestorage)
    {
        return toAjax(medicinestorageService.insertMedicinestorage(medicinestorage));
    }

    /**
     * 修改药品环境
     */
    @PreAuthorize("@ss.hasPermi('medicine:medicinestorage:edit')")
    @Log(title = "药品环境", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Medicinestorage medicinestorage)
    {
        return toAjax(medicinestorageService.updateMedicinestorage(medicinestorage));
    }

    /**
     * 删除药品环境
     */
    @PreAuthorize("@ss.hasPermi('medicine:medicinestorage:remove')")
    @Log(title = "药品环境", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(medicinestorageService.deleteMedicinestorageByIds(ids));
    }
}
