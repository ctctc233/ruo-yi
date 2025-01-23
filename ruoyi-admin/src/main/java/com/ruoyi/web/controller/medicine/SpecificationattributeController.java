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
import com.ruoyi.medicine.domain.Specificationattribute;
import com.ruoyi.medicine.service.ISpecificationattributeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 药品规格Controller
 * 
 * @author ruoyi
 * @date 2025-01-24
 */
@RestController
@RequestMapping("/medicine/specificationattribute")
public class SpecificationattributeController extends BaseController
{
    @Autowired
    private ISpecificationattributeService specificationattributeService;

    /**
     * 查询药品规格列表
     */
    @PreAuthorize("@ss.hasPermi('medicine:specificationattribute:list')")
    @GetMapping("/list")
    public TableDataInfo list(Specificationattribute specificationattribute)
    {
        startPage();
        List<Specificationattribute> list = specificationattributeService.selectSpecificationattributeList(specificationattribute);
        return getDataTable(list);
    }

    /**
     * 导出药品规格列表
     */
    @PreAuthorize("@ss.hasPermi('medicine:specificationattribute:export')")
    @Log(title = "药品规格", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Specificationattribute specificationattribute)
    {
        List<Specificationattribute> list = specificationattributeService.selectSpecificationattributeList(specificationattribute);
        ExcelUtil<Specificationattribute> util = new ExcelUtil<Specificationattribute>(Specificationattribute.class);
        util.exportExcel(response, list, "药品规格数据");
    }

    /**
     * 获取药品规格详细信息
     */
    @PreAuthorize("@ss.hasPermi('medicine:specificationattribute:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(specificationattributeService.selectSpecificationattributeById(id));
    }

    /**
     * 新增药品规格
     */
    @PreAuthorize("@ss.hasPermi('medicine:specificationattribute:add')")
    @Log(title = "药品规格", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Specificationattribute specificationattribute)
    {
        return toAjax(specificationattributeService.insertSpecificationattribute(specificationattribute));
    }

    /**
     * 修改药品规格
     */
    @PreAuthorize("@ss.hasPermi('medicine:specificationattribute:edit')")
    @Log(title = "药品规格", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Specificationattribute specificationattribute)
    {
        return toAjax(specificationattributeService.updateSpecificationattribute(specificationattribute));
    }

    /**
     * 删除药品规格
     */
    @PreAuthorize("@ss.hasPermi('medicine:specificationattribute:remove')")
    @Log(title = "药品规格", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(specificationattributeService.deleteSpecificationattributeByIds(ids));
    }
}
