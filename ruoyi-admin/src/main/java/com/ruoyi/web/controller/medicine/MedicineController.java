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
import com.ruoyi.medicine.domain.Medicine;
import com.ruoyi.medicine.service.IMedicineService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 药品Controller
 *
 * @author ruoyi
 * @date 2025-01-24
 */
@RestController
@RequestMapping("/medicine/medicine")
public class MedicineController extends BaseController {
	@Autowired
	private IMedicineService medicineService;

	/**
	 * 查询药品列表
	 */
	@PreAuthorize("@ss.hasPermi('medicine:medicine:list')")
	@GetMapping("/list")
	public TableDataInfo list(Medicine medicine) {
		startPage();
		List<Medicine> list = medicineService.selectMedicineList(medicine);
		return getDataTable(list);
	}

	/**
	 * 导出药品列表
	 */
	@PreAuthorize("@ss.hasPermi('medicine:medicine:export')")
	@Log(title = "药品", businessType = BusinessType.EXPORT)
	@PostMapping("/export")
	public void export(HttpServletResponse response, Medicine medicine) {
		List<Medicine> list = medicineService.selectMedicineList(medicine);
		ExcelUtil<Medicine> util = new ExcelUtil<Medicine>(Medicine.class);
		util.exportExcel(response, list, "药品数据");
	}

	/**
	 * 获取药品详细信息
	 */
	@PreAuthorize("@ss.hasPermi('medicine:medicine:query')")
	@GetMapping(value = "/{id}")
	public AjaxResult getInfo(@PathVariable("id") Long id) {
		return success(medicineService.selectMedicineById(id));
	}

	/**
	 * 新增药品
	 */
	@PreAuthorize("@ss.hasPermi('medicine:medicine:add')")
	@Log(title = "药品", businessType = BusinessType.INSERT)
	@PostMapping
	public AjaxResult add(@RequestBody Medicine medicine) {
		return toAjax(medicineService.insertMedicine(medicine));
	}

	/**
	 * 修改药品
	 */
	@PreAuthorize("@ss.hasPermi('medicine:medicine:edit')")
	@Log(title = "药品", businessType = BusinessType.UPDATE)
	@PutMapping
	public AjaxResult edit(@RequestBody Medicine medicine) {
		return toAjax(medicineService.updateMedicine(medicine));
	}

	/**
	 * 删除药品
	 */
	@PreAuthorize("@ss.hasPermi('medicine:medicine:remove')")
	@Log(title = "药品", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
	public AjaxResult remove(@PathVariable Long[] ids) {
		return toAjax(medicineService.deleteMedicineByIds(ids));
	}

	/**
	 * 查询过期药品
	 */
	@PreAuthorize("@ss.hasPermi('medicine:medicine:query')")
	@GetMapping(value = "/queryExpired")
	public AjaxResult queryExpiredMedicine() {
		return success(medicineService.selectExpiredMedicine());
	}
}
