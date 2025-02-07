<template>
  <div class="app-container">
    <el-form
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
    </el-form>

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
      <el-col :span="1.5">
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
      </el-col>
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
      v-loading="loading"
      :data="medicineList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="40" align="center" />
      <el-table-column label="药品编号" align="center" prop="number" />
      <!-- <el-table-column label="药品id" align="center" prop="id" /> -->
      <el-table-column label="药品名称" align="center" prop="name" />

      <el-table-column label="药品品牌" align="center" prop="brand" />
      <!-- 修改规格列 -->
      <el-table-column
        label="规格类型"
        align="center"
        prop="specificationAttributekey"
      />
      <el-table-column
        label="规格值"
        align="center"
        prop="specificationAttributename"
      />
      <el-table-column
        label="过期时间"
        align="center"
        prop="expiryDate"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.expiryDate, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>

      <el-table-column label="厂商" align="center" prop="manufacturer" />
      <el-table-column label="单位" align="center" prop="unit" />
      <el-table-column label="数量" align="center" prop="count" />

      <el-table-column label="状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.medicine_status"
            :value="scope.row.status"
          />
        </template>
      </el-table-column>
      <!--存放位置-->
      <!-- <el-table-column label="存放位置" align="center" prop="location" /> -->

      <el-table-column
        label="操作"
        align="center"
        style="width:150px"
      >
        <template slot-scope="scope">
          <div style="display: flex; gap: 0px; justify-content: center">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleDetails(scope.row)"
              >详情</el-button
            >
            <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['medicine:medicine:edit']"
              >修改</el-button
            >
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['medicine:medicine:remove']"
              >删除</el-button
            >
          </div>
        </template>
      </el-table-column>
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
        <el-form-item label="存放环境" prop="location">
          <el-input v-model="form.location" placeholder="请输入存放环境" />
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

    <el-dialog
      title="药品详情"
      :visible.sync="openDetails"
      width="500px"
      append-to-body
      @close="handleClose">
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
          <dict-tag
            :options="dict.type.medicine_status"
            :value="form.status"
          />
        </el-form-item>
      </el-form>
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
} from "@/api/medicine/medicine";
import {
  getListBatch,
  listBatch,
  getBatch,
  delBatch,
  addBatch,
  updateBatch,
} from "@/api/medicine/batch";

export default {
  name: "Medicine",
  dicts: ["medicine_status"],
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
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      openDetails: false,
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
      // 表单校验
      specifications: [
        { id: 1, key: "测试", name: "规格A" },
        { id: 2, key: "测试", name: "规格B" },
        { id: 3, key: "测试", name: "规格C" },
        // 其他的规格...
      ],

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
    // 取消按钮
    cancel() {
      this.open = false;
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
      this.open = true;
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
