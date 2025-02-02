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
import com.ruoyi.medicine.domain.StorageEnvironment;
import com.ruoyi.medicine.service.IStorageEnvironmentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 存放环境Controller
 *
 * @author ruoyi
 * @date 2025-01-24
 */
@RestController
@RequestMapping("/medicine/storageenvironment")
public class StorageEnvironmentController extends BaseController {
	@Autowired
	private IStorageEnvironmentService storageenvironmentService;

	/**
	 * 查询存放环境列表
	 */
	@PreAuthorize("@ss.hasPermi('medicine:storageenvironment:list')")
	@GetMapping("/list")
	public TableDataInfo list(StorageEnvironment storageenvironment) {
		startPage();
		List<StorageEnvironment> list = storageenvironmentService.selectStorageEnvironmentList(storageenvironment);
		return getDataTable(list);
	}

	/**
	 * 导出存放环境列表
	 */
	@PreAuthorize("@ss.hasPermi('medicine:storageenvironment:export')")
	@Log(title = "存放环境", businessType = BusinessType.EXPORT)
	@PostMapping("/export")
	public void export(HttpServletResponse response, StorageEnvironment storageenvironment) {
		List<StorageEnvironment> list = storageenvironmentService.selectStorageEnvironmentList(storageenvironment);
		ExcelUtil<StorageEnvironment> util = new ExcelUtil<StorageEnvironment>(StorageEnvironment.class);
		util.exportExcel(response, list, "存放环境数据");
	}

	/**
	 * 获取存放环境详细信息
	 */
	@PreAuthorize("@ss.hasPermi('medicine:storageenvironment:query')")
	@GetMapping(value = "/{id}")
	public AjaxResult getInfo(@PathVariable("id") Long id) {
		return success(storageenvironmentService.selectStorageEnvironmentById(id));
	}

	/**
	 * 新增存放环境
	 */
	@PreAuthorize("@ss.hasPermi('medicine:storageenvironment:add')")
	@Log(title = "存放环境", businessType = BusinessType.INSERT)
	@PostMapping
	public AjaxResult add(@RequestBody StorageEnvironment storageenvironment) {
		return toAjax(storageenvironmentService.insertStorageEnvironment(storageenvironment));
	}

	/**
	 * 修改存放环境
	 */
	@PreAuthorize("@ss.hasPermi('medicine:storageenvironment:edit')")
	@Log(title = "存放环境", businessType = BusinessType.UPDATE)
	@PutMapping
	public AjaxResult edit(@RequestBody StorageEnvironment storageenvironment) {
		return toAjax(storageenvironmentService.updateStorageEnvironment(storageenvironment));
	}

	/**
	 * 删除存放环境
	 */
	@PreAuthorize("@ss.hasPermi('medicine:storageenvironment:remove')")
	@Log(title = "存放环境", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
	public AjaxResult remove(@PathVariable Long[] ids) {
		return toAjax(storageenvironmentService.deleteStorageEnvironmentByIds(ids));
	}
}
