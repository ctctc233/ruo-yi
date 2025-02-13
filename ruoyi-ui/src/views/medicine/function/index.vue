<template>
  <div class="app-container">
    <!-- <el-form
        :model="queryParams"
        ref="queryForm"
        size="small"
        :inline="true"
        v-show="showSearch"
        label-width="68px"
      >
        <el-form-item label="药品名称" prop="name">
          <el-input
            v-model="queryParams.name"
            placeholder="请输入名称"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="药品编号" prop="number">
          <el-input
            v-model="queryParams.number"
            placeholder="请输入药品编号"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="药品品牌" prop="brand">
          <el-input
            v-model="queryParams.brand"
            placeholder="请输入药品品牌"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="过期时间" prop="expiryDate">
          <el-date-picker
            clearable
            v-model="queryParams.expiryDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择过期时间"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-select
            v-model="queryParams.status"
            placeholder="请选择状态"
            clearable
          >
            <el-option
              v-for="dict in dict.type.medicine_status"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button
            type="primary"
            icon="el-icon-search"
            size="mini"
            @click="handleQuery"
            >搜索</el-button
          >
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
            >重置</el-button
          >
        </el-form-item>
      </el-form> -->

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['medicine:medicine:add']"
          >入库</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-delete"
          size="mini"
          @click="handReduce"
          v-hasPermi="['medicine:medicine:add']"
          >出库</el-button
        >
      </el-col>
      <!-- <el-col :span="1.5">
          <el-button
            type="warning"
            plain
            icon="el-icon-edit"
            size="mini"
            :disabled="single"
            @click="handleUpdate"
            v-hasPermi="['medicine:medicine:edit']"
            >修改</el-button
          >
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="danger"
            plain
            icon="el-icon-delete"
            size="mini"
            :disabled="multiple"
            @click="handleDelete"
            v-hasPermi="['medicine:medicine:remove']"
            >删除</el-button
          >
        </el-col> -->
      <!-- <el-col :span="1.5">
          <el-button
            type="warning"
            plain
            icon="el-icon-download"
            size="mini"
            @click="handleExport"
            v-hasPermi="['medicine:medicine:export']"
            >导出</el-button
          >
        </el-col> -->

      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      ref="tables"
      v-loading="loading"
      :data="logFormList"
      @selection-change="handleSelectionChange"
      :default-sort="defaultSort"
      @sort-change="handleSortChange"
    >
      <el-table-column type="selection" width="50" align="center" />
      <el-table-column label="日志编号" align="center" prop="operId" />
      <el-table-column
        label="系统模块"
        align="center"
        prop="title"
        :show-overflow-tooltip="true"
      />
      <!-- <el-table-column label="操作类型" align="center" prop="businessType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_oper_type" :value="scope.row.businessType"/>
        </template>
      </el-table-column> -->
      <el-table-column
        label="操作人员"
        align="center"
        prop="operName"
        width="110"
        :show-overflow-tooltip="true"
       
        :sort-orders="['descending', 'ascending']"
      />
      <!-- sortable="custom" -->
      <el-table-column
        label="操作地址"
        align="center"
        prop="operIp"
        width="130"
        :show-overflow-tooltip="true"
      />
      <el-table-column
        label="操作地点"
        align="center"
        prop="operLocation"
        :show-overflow-tooltip="true"
      />
      <el-table-column label="操作状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.sys_common_status"
            :value="scope.row.status"
          />
        </template>
      </el-table-column>
      <el-table-column
        label="操作日期"
        align="center"
        prop="operTime"
        width="160"
       
        :sort-orders="['descending', 'ascending']"
      >
      <!-- sortable="custom" -->
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.operTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="消耗时间"
        align="center"
        prop="costTime"
        width="110"
        :show-overflow-tooltip="true"
       
        :sort-orders="['descending', 'ascending']"
      >
      <!--  sortable="custom" -->
        <template slot-scope="scope">
          <span>{{ scope.row.costTime }}毫秒</span>
        </template>
      </el-table-column>
      <!-- <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleView(scope.row, scope.index)"
            v-hasPermi="['monitor:operlog:query']"
            >详细</el-button
          >
        </template>
      </el-table-column> -->
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改药品对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="药品名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入名字" />
        </el-form-item>
        <el-form-item label="药品编号" prop="number">
          <el-input v-model="form.number" placeholder="请输入编号" />
        </el-form-item>
        <el-form-item label="药品品牌" prop="brand">
          <el-input v-model="form.brand" placeholder="请输入品牌" />
        </el-form-item>
        <el-form-item label="规格健" prop="specificationAttributekey">
          <el-input
            v-model="form.specificationAttributekey"
            placeholder="请输入规格健"
          />
        </el-form-item>
        <el-form-item label="规格值" prop="specificationAttributename">
          <el-input
            v-model="form.specificationAttributename"
            placeholder="请输入规格值"
          />
        </el-form-item>
        <el-form-item label="药品批次" prop="batchNumber">
          <el-select v-model="form.batchNumber" placeholder="请选择批次编号">
            <el-option
              v-for="item in batchList"
              :key="item.id"
              :label="item.batchNumber"
              :value="item.batchNumber"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="生产时间" prop="productionDate">
          <el-date-picker
            clearable
            v-model="form.productionDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择生产时间"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="过期时间" prop="expiryDate">
          <el-date-picker
            clearable
            v-model="form.expiryDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择过期时间"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="厂商" prop="manufacturer">
          <el-input v-model="form.manufacturer" placeholder="请输入厂商" />
        </el-form-item>
        <el-form-item label="单位" prop="unit">
          <el-input v-model="form.unit" placeholder="请输入单位" />
        </el-form-item>
        <el-form-item label="数量" prop="count">
          <el-input v-model="form.count" placeholder="请输入数量" />
        </el-form-item>
        <!-- <el-form-item label="存放环境" prop="location">
            <el-input v-model="form.location" placeholder="请输入存放环境" />
          </el-form-item> -->
        <el-form-item label="存放环境" prop="location">
          <el-select v-model="form.location" placeholder="请选择批次编号">
            <el-option
              v-for="item in locationList"
              :key="item.id"
              :label="item.location"
              :value="item.location"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in dict.type.medicine_status"
              :key="dict.value"
              :label="parseInt(dict.value)"
              >{{ dict.label }}</el-radio
            >
          </el-radio-group>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <!--药品详情弹窗-->
    <el-dialog
      title="药品详情"
      :visible.sync="openDetails"
      width="500px"
      append-to-body
      @close="handleClose"
    >
      <el-form :model="form" label-width="100px">
        <el-form-item label="药品名称：">{{ form.name }}</el-form-item>
        <!-- <el-form-item label="药品编号">{{ form.number }}</el-form-item> -->
        <el-form-item label="药品品牌：">{{ form.brand }}</el-form-item>
        <!-- <el-form-item label="规格健">{{ form.specificationAttributekey }}</el-form-item>
          <el-form-item label="规格值">{{ form.specificationAttributename }}</el-form-item> -->
        <el-form-item label="药品批次：">{{ form.batchNumber }}</el-form-item>
        <el-form-item label="生产时间：">
          {{ parseTime(form.productionDate, "{y}-{m}-{d}") }}
        </el-form-item>
        <el-form-item label="过期时间：">
          {{ parseTime(form.expiryDate, "{y}-{m}-{d}") }}
        </el-form-item>
        <el-form-item label="生产厂商：">{{ form.manufacturer }}</el-form-item>
        <!-- <el-form-item label="单位">{{ form.unit }}</el-form-item> -->
        <el-form-item label="药品数量：">{{ form.count }}</el-form-item>
        <el-form-item label="存放环境：">{{ form.location }}</el-form-item>
        <el-form-item label="药品状态：">
          <dict-tag :options="dict.type.medicine_status" :value="form.status" />
        </el-form-item>
      </el-form>
    </el-dialog>

    <!--出库弹窗列表-->
    <el-dialog
      :title="title"
      :visible.sync="outMenOpen"
      width="500px"
      append-to-body
    >
      <el-form ref="outMenform" :model="outMenform" label-width="80px">
        <el-form-item label="药品名称" prop="name">
          <el-input v-model="outMenform.name" placeholder="请输入名字" />
        </el-form-item>

        <el-form-item label="数量" prop="count">
          <el-input v-model="outMenform.count" placeholder="请输入数量" />
        </el-form-item>
        <el-form-item label="存放环境" prop="location">
          <el-select v-model="outMenform.location" placeholder="请选择批次编号">
            <el-option
              v-for="item in locationList"
              :key="item.id"
              :label="item.location"
              :value="item.location"
            >
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="outMenSub">确 定</el-button>
        <el-button @click="outMenCancel">取 消</el-button>
      </div>
    </el-dialog>

    <el-dialog
      title="操作日志详细"
      :visible.sync="Logopen"
      width="800px"
      append-to-body
    >
      <el-form ref="form" :model="logForm" label-width="100px" size="mini">
        <el-row>
          <el-col :span="12">
            <el-form-item label="操作模块："
              >{{ form.title }} / {{ typeFormat(form) }}</el-form-item
            >
            <el-form-item label="登录信息："
              >{{ form.operName }} / {{ form.operIp }} /
              {{ form.operLocation }}</el-form-item
            >
          </el-col>
          <el-col :span="12">
            <el-form-item label="请求地址：">{{ form.operUrl }}</el-form-item>
            <el-form-item label="请求方式：">{{
              form.requestMethod
            }}</el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="操作方法：">{{ form.method }}</el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="请求参数：">{{ form.operParam }}</el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="返回参数：">{{
              form.jsonResult
            }}</el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="操作状态：">
              <div v-if="form.status === 0">正常</div>
              <div v-else-if="form.status === 1">失败</div>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="消耗时间："
              >{{ form.costTime }}毫秒</el-form-item
            >
          </el-col>
          <el-col :span="8">
            <el-form-item label="操作时间：">{{
              parseTime(form.operTime)
            }}</el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="异常信息：" v-if="form.status === 1">{{
              form.errorMsg
            }}</el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="open = false">关 闭</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listMedicine,
  MedicineType,
  getMedicine,
  delMedicine,
  addMedicine,
  updateMedicine,
  outMedicine,
  listLog,
} from "@/api/medicine/medicine";
import {
  getListBatch,
  listBatch,
  getBatch,
  delBatch,
  addBatch,
  updateBatch,
} from "@/api/medicine/batch";
import { listStorageenvironment } from "@/api/medicine/storageenvironment";

export default {
  name: "Medicine",
  dicts: ["medicine_status", "sys_oper_type", "sys_common_status"],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 药品表格数据
      medicineList: [],
      //批次表数据
      batchList: [],
      //存放环境表数据
      locationList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      openDetails: false,
      outMenOpen: false,
      Logopen: false,
      // 默认排序
      defaultSort: { prop: "operTime", order: "descending" },
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        number: null,
        brand: null,
        batchNumber: null,
        specificationAttributekey: null,
        specificationAttributename: null,
        productionDate: null,
        expiryDate: null,
        manufacturer: null,
        unit: null,
        count: null,
        status: null,
      },

      // 表单参数
      form: {},
      logForm: {},
      outMenform: {},
      logFormList: [],
      // 表单校验
      rules: {
        name: [{ required: true, message: "名字不能为空", trigger: "blur" }],
        number: [{ required: true, message: "编号不能为空", trigger: "blur" }],
        count: [{ required: true, message: "数量不能为空", trigger: "blur" }],
        location: [
          { required: true, message: "存放环境不能为空", trigger: "blur" },
        ],
        specificationAttributekey: [
          { required: true, message: "规格类型不能为空", trigger: "blur" },
        ],
        specificationAttributename: [
          { required: true, message: "规格名称不能为空", trigger: "blur" },
        ],
        batchNumber: [
          { required: true, message: "批次编号不能为空", trigger: "blur" },
        ],
        status: [
          {
            required: true,
            message: "状态",
            trigger: "change",
          },
        ],
        createTime: [
          { required: true, message: "创建时间不能为空", trigger: "blur" },
        ],
        updateTime: [
          { required: true, message: "修改时间不能为空", trigger: "blur" },
        ],
      },
      MedicineType: {},
    };
  },
  created() {
    this.getList();
    this.getBranchList();
    this.getlocationList();
    this.getListLog();
  },
  methods: {
    getSpecificationName(specificationAttributeId) {
      const specification = this.specifications.find(
        (spec) => spec.id === specificationAttributeId
      );
      return specification
        ? `${specification.key}:${specification.name}`
        : "未知规格";
    },

    /** 查询药品列表 */
    getList() {
      this.loading = true;
      listMedicine(this.queryParams).then((response) => {
        this.medicineList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },

    /** 查询批次列表 */
    getBranchList() {
      this.loading = true;
      getListBatch().then((response) => {
        this.batchList = response.rows;
        // console.log(response.rows);
        // console.log(this.batchList);
        // this.batchList = response.rows;
        // this.total = response.total;
        // this.loading = false;
      });
    },
    /** 查询环境列表 */
    getlocationList() {
      this.loading = true;
      listStorageenvironment().then((response) => {
        this.locationList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    outMenCancel() {
      this.outMenOpen = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        name: null,
        number: null,
        brand: null,
        batchNumber: null,
        specificationAttributeId: null,
        productionDate: null,
        expiryDate: null,
        manufacturer: null,
        unit: null,
        count: null,
        status: null,
        createTime: null,
        updateTime: null,
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.id);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加药品";
    },
    /*** 出库管理*/
    handReduce() {
      this.reset();
      this.outMenOpen = true;
      this.title = "药品出库";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getMedicine(id).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改药品";
      });
    },
    /** 详情按钮操作 */
    handleDetails(row) {
      this.reset();
      const id = row.id || this.ids;
      getMedicine(id).then((response) => {
        this.form = response.data;
        this.openDetails = true;
      });
    },
    handleClose() {
      this.openDetails = false;
    },
    /** 详细按钮操作 */
    handleView(row) {
      this.Logopen = true;
      this.logForm = row;
    },
    /** 排序触发事件 */
    handleSortChange(column, prop, order) {
      this.queryParams.orderByColumn = column.prop;
      this.queryParams.isAsc = column.order;
      this.getListLog();
    },
    // 操作日志类型字典翻译
    typeFormat(row, column) {
      return this.selectDictLabel(
        this.dict.type.sys_oper_type,
        row.businessType
      );
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            updateMedicine(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addMedicine(this.form).then((response) => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },

    /**出库功能*/
    async outMenSub() {
      // 验证表单
      this.$refs.outMenform.validate(async (valid) => {
        if (valid) {
          try {
            // 准备数据对象
            const data = {
              name: this.outMenform.name,
              count: this.outMenform.count,
              location: this.outMenform.location,
            };
            // 调用 API
            const response = await outMedicine(data);
            // console.log(response);
            // 处理响应
            if (response.code === 200) {
              this.$message({
                message: "出库成功",
                type: "success",
              });
              // 重置表单并关闭弹窗
              this.resetForm();
              this.outMenOpen = false; // 关闭弹窗
            } else {
              this.$message.error(response.message || "出库失败，请再试");
            }
          } catch (error) {
            console.error(error);
            this.$message.error("出库请求失败");
          }
        } else {
          this.$message.error("请填写完整的表单");
        }
      });
    },
    /**查询出库入库日志*/
    getListLog() {
      this.loading = true;
      listLog().then((response) => {
        this.logFormList = response.rows;
        console.log(this.logFormList);
      });
    },
    resetForm() {
      // 重置表单字段
      this.outMenform = {
        name: "",
        count: "",
        location: "",
      };
      // this.$refs.outMenform.resetFields(); // 重置验证状态
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal
        .confirm('是否确认删除药品编号为"' + ids + '"的数据项？')
        .then(function () {
          return delMedicine(ids);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "medicine/medicine/export",
        {
          ...this.queryParams,
        },
        `medicine_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
