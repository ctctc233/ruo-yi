<template>
  <div style="padding-left: 20px;">
    <el-tabs v-model="activeName" @tab-click="handleClick">
      <el-tab-pane label="时间预警" name="first">
        <!-- <h1>临期药品列表</h1>   -->
        <el-table :data="medicines" style="width: 100%">
          <el-table-column prop="medicineName" label="药品名称" />
          <el-table-column prop="productionDate" label="生产日期" />
          <el-table-column prop="expirationDate" label="结束日期" />
          <el-table-column label="状态">
            <template slot-scope="scope">
              <el-tag v-if="scope.row.days < 0" type="danger" size="medium"
                >已过期</el-tag
              >
              <el-tag
                v-else-if="
                  scope.row.days > 0 &&
                  scope.row.days < scope.row.expirationThresholdDays
                "
                type="warning"
                size="medium"
                >快过期</el-tag
              >
              <el-tag v-else size="medium">&nbsp;</el-tag>
            </template>
          </el-table-column>
        </el-table>
      </el-tab-pane>
      <el-tab-pane label="数量预警" name="second">数量预警</el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import { getExpiredMedicine } from "@/api/medicine/medicine";

export default {
  data() {
    return {
      medicines: [],
      activeName: "first",
    };
  },
  created() {
    this.getExpiredMedicine();
  },
  methods: {
    async getExpiredMedicine() {
      try {
        const res = await getExpiredMedicine();
        if (res.code === 200) {
          // 过滤药品，只保留符合条件的药品
          this.medicines = res.rows.filter(
            (medicine) => medicine.days < medicine.expirationThresholdDays
          );
        } else {
          console.error(res.msg);
        }
      } catch (error) {
        console.error("获取药品数据时出错:", error);
      }
    },
    handleClick(tab, event) {
      console.log(tab, event);
    },
  },
};
</script>

<style lang="scss" scoped></style>
