package com.ruoyi.web.controller.medicine;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.medicine.domain.MedicineExpirationApproaching;
import com.ruoyi.medicine.domain.MedicinePro;
import com.ruoyi.medicine.domain.MedicineRemainingStock;
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
	@Log(title = "药品入库", businessType = BusinessType.INSERT)
	@PostMapping
	public AjaxResult add(@RequestBody MedicinePro medicine) {
		System.out.println("新增药品: " + medicine);

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
	 * 药品出库
	 */
	@PreAuthorize("@ss.hasPermi('medicine:medicine:out')")
	@Log(title = "药品出库", businessType = BusinessType.UPDATE)
	@PutMapping("/outMedicine")
	public AjaxResult outMedicine(@RequestBody MedicinePro medicine) {
		int totalCount = medicineService.selectMedicineStock(medicine.getName(), medicine.getLocation());
		if (medicine.getCount() > totalCount) {
			return error("药品库存不足，当前库存量：" + totalCount + "，请确认后再出库！");
		} else {
			return toAjax(medicineService.outMedicine(medicine.getName(), medicine.getCount(), medicine.getLocation()));
		}
	}

	/**
	 * 药品库存查询
	 */
	@PreAuthorize("@ss.hasPermi('medicine:medicine:stock')")
	@GetMapping("/stock")
	public AjaxResult outMedicineDetail(@RequestParam(required = false) String name, @RequestParam(required = false) String location) {
		System.out.println("查询药品库存: " + medicineService.selectMedicineStock(name, location));
		return success(medicineService.selectMedicineStock(name, location));
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

	/**
	 * 查询药品详情
	 */
//	@PreAuthorize("@ss.hasPermi('medicine:medicine:detail')")
//	@GetMapping(value = "/detail/{number}")
//	public AjaxResult detail(Long number) {
//		return success(medicineService.selectMedicineDetail(number));
//	}

	/**
	 * 查询药品临期列表
	 */
	@PreAuthorize("@ss.hasPermi('medicine:medicine:listNearExpirationMedicines')")
	@GetMapping("/listNearExpirationMedicines")
	public TableDataInfo listNearExpirationMedicines() {
		MedicinePro medicine = new MedicinePro();
		startPage();
		List<MedicineExpirationApproaching> list = medicineService.selectNearExpirationMedicineslist(medicine);
//		for (MedicineExpirationApproaching medicineExpirationApproaching : list) {
//			System.out.println(medicineExpirationApproaching);
//		}
		return getDataTable(list);
	}

	/**
	 * 查询药品临期列表
	 */
	@PreAuthorize("@ss.hasPermi('medicine:medicine:listRemainingStockMedicine')")
	@GetMapping("/listRemainingStockMedicine")
	public TableDataInfo listRemainingStockMedicine() {
		List<MedicineRemainingStock> list = medicineService.listRemainingStockMedicine();
		return getDataTable(list);
	}


}
