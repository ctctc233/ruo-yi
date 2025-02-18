<template>  
  <div style="padding-left: 20px">  
    <el-tabs v-model="activeName" @tab-click="handleClick">  
      <el-tab-pane label="时间预警" name="first">  
        <el-table :data="medicines" style="width: 100%">  
          <el-table-column prop="medicineName" label="药品名称" align="center"/>  
          <el-table-column prop="productionDate" label="生产日期" align="center"/>  
          <el-table-column prop="expirationDate" label="结束日期" align="center" />  
          <el-table-column label="状态">  
            <template slot-scope="scope" align="center">  
              <el-tag v-if="scope.row.days < 0" type="danger" size="medium"  
              align="center"
                >已过期</el-tag  
              >  
              <el-tag  
                v-else-if="  
                  scope.row.days > 0 &&  
                  scope.row.days < scope.row.expirationThresholdDays  
                "  
                type="warning"  
                size="medium"  
                align="center"
                >快过期</el-tag  
              >  
              <el-tag v-else size="medium">&nbsp;</el-tag>  
            </template>  
          </el-table-column>  
        </el-table>  
      </el-tab-pane>  
      <el-tab-pane label="数量预警" name="second">  
        <el-table :data="remainingMedicines" style="width: 100%">  
          <el-table-column prop="name" label="药品名称" align="center"/>  
          <el-table-column prop="count" label="库存数量" align="center"/>  
          <el-table-column label="状态">  
            <template slot-scope="scope">  
              <el-tag  
                v-if="scope.row.count < scope.row.threshold"  
                type="danger"  
                size="medium"  
                align="center"
                >库存不足</el-tag  
              >  
              <el-tag v-else size="medium">&nbsp;</el-tag>  
            </template>  
          </el-table-column>  
        </el-table>  
      </el-tab-pane>  
    </el-tabs>  
  </div>  
</template>  

<script>  
import {  
  getExpiredMedicine,  
  getlistRemainingStockMedicine,  
} from "@/api/medicine/medicine";  

export default {  
  data() {  
    return {  
      medicines: [],  
      remainingMedicines: [], // 新增用于存储剩余库存药品的数组  
      activeName: "first",  
    };  
  },  
  created() {  
    this.getExpiredMedicine();  
    this.getlistRemaining();  
  },  
  methods: {  
    async getExpiredMedicine() {  
      try {  
        const res = await getExpiredMedicine();  
        if (res.code === 200) {  
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
    async getlistRemaining() {  
      try {  
        const response = await getlistRemainingStockMedicine();  
        if (response.code === 200) {  
          this.remainingMedicines = response.rows.filter(  
            (medicine) => medicine.count < medicine.threshold  
          );  
        } else {  
          console.error(response.msg);  
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