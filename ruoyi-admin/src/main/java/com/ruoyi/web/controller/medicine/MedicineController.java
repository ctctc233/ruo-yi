package com.ruoyi.web.controller.medicine;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.medicine.domain.Medicine;
import com.ruoyi.medicine.domain.MedicinePro;
import com.ruoyi.medicine.service.IMedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

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
	public TableDataInfo list(MedicinePro medicine) {
		startPage();
		List<MedicinePro> list = medicineService.selectMedicineList(medicine);
//		for (MedicinePro medicine1 : list) {
//			System.out.println("查询药品: ");
//			System.out.println(medicine1);
//		}
		return getDataTable(list);
	}

	/**
	 * 导出药品列表
	 */
	@PreAuthorize("@ss.hasPermi('medicine:medicine:export')")
	@Log(title = "药品", businessType = BusinessType.EXPORT)
	@PostMapping("/export")
	public void export(HttpServletResponse response, MedicinePro medicine) {
		List<MedicinePro> list = medicineService.selectMedicineList(medicine);
		ExcelUtil<MedicinePro> util = new ExcelUtil<MedicinePro>(MedicinePro.class);
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
	public AjaxResult add(@RequestBody MedicinePro medicine) {
		System.out.println("新增药品: " + medicine);
		// 创建假数据
//		Long id = 1L;
//		String batchNumber = "BATCH12345";
//		String location = "仓库B";
//		String name = "阿莫西林";
//		Long number = 1001L;
//		String brand = "xxx";
//		String attributeKey = "规格";
//		String attributeValue = "10片/盒";
//		Date productionDate = new Date(); // 当前时间作为生产日期
//		Date expiryDate = new Date(System.currentTimeMillis() + 365L * 24 * 60 * 60 * 1000); // 一年后过期
//		String manufacturer = "阿莫西林生制药厂";
//		String unit = "盒";
//		Long count = 100L;
//		Long status = 0L; // 0：正常
//
//		// 使用有参构造器创建对象
//		MedicinePro m = new MedicinePro(id, batchNumber, location, name, number, brand, attributeKey, attributeValue, productionDate, expiryDate, manufacturer, unit, count, status);

		return toAjax(medicineService.insertMedicine(medicine));
	}

	/**
	 * 修改药品
	 */
	@PreAuthorize("@ss.hasPermi('medicine:medicine:edit')")
	@Log(title = "药品", businessType = BusinessType.UPDATE)
	@PutMapping
	public AjaxResult edit(@RequestBody MedicinePro medicinePro) {
		return toAjax(medicineService.updateMedicine(medicinePro));
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
