<template>
  <el-row :gutter="40" class="panel-group">
    <el-col :xs="12" :sm="12" :lg="6" class="card-panel-col">
      <div class="card-panel" @click="handleSetLineChartData('newVisitis')">
        <div class="card-panel-icon-wrapper icon-people">
          <svg-icon icon-class="peoples" class-name="card-panel-icon" />
        </div>
        <div class="card-panel-description">
          <div class="card-panel-text">操作次数</div>
          <count-to
            :start-val="0"
            :end-val="this.logForm.total"
            :duration="2600"
            class="card-panel-num"
          />
        </div>
      </div>
    </el-col>
    <el-col :xs="12" :sm="12" :lg="6" class="card-panel-col">
      <div class="card-panel" @click="handleSetLineChartData('messages')">
        <div class="card-panel-icon-wrapper icon-message">
          <svg-icon icon-class="message" class-name="card-panel-icon" />
        </div>
        <div class="card-panel-description">
          <div class="card-panel-text">库存总量</div>
          <count-to
            :start-val="0"
            :end-val="this.form.total"
            :duration="3000"
            class="card-panel-num"
          />
        </div>
      </div>
    </el-col>
    <el-col :xs="12" :sm="12" :lg="6" class="card-panel-col">
      <div class="card-panel" @click="handleSetLineChartData('purchases')">
        <div class="card-panel-icon-wrapper icon-money">
          <svg-icon icon-class="money" class-name="card-panel-icon" />
        </div>
        <div class="card-panel-description">
          <div class="card-panel-text">时间预警药品</div>
          <count-to
            :start-val="0"
            :end-val="totalCount"
            :duration="3200"
            class="card-panel-num"
          />
        </div>
      </div>
    </el-col>
    <el-col :xs="12" :sm="12" :lg="6" class="card-panel-col">
      <div class="card-panel" @click="handleSetLineChartData('shoppings')">
        <div class="card-panel-icon-wrapper icon-shopping">
          <svg-icon icon-class="shopping" class-name="card-panel-icon" />
        </div>
        <div class="card-panel-description">
          <div class="card-panel-text">库存预警</div>
          <count-to
            :start-val="0"
            :end-val="imminentCount"
            :duration="3600"
            class="card-panel-num"
          />
        </div>
      </div>
    </el-col>
  </el-row>
</template>

<script>
import CountTo from "vue-count-to";
import {
  listMedicine,
  listLog,
  getExpiredMedicine,
  getlistRemainingStockMedicine,
} from "@/api/medicine/medicine";

export default {
  components: {
    CountTo,
  },
  data() {
    return {
      chart: null,
      data: [],
      form: {},
      logForm: {},
      expiredForm: {},
      totalCount: 0,
      remaining: [],
      imminentCount: 0,
    };
  },
  created() {
    this.getExpiredMedicine();
    this.getLog();
    this.getExpired();
    this.getlistRemaining();
  },
  methods: {
    handleSetLineChartData(type) {
      this.$emit("handleSetLineChartData", type);
    },
    async getExpiredMedicine() {
      try {
        this.form = await listMedicine();
        // console.log(this.form)
      } catch (error) {
        console.log(error);
      }
    },
    async getLog() {
      try {
        this.logForm = await listLog();
        // console.log(this.logForm)
      } catch (error) {
        console.log(error);
      }
    },
    async getExpired() {
      try {
        // 获取药品数据
        const response = await getExpiredMedicine();
        this.expiredForm = response.rows || []; // 默认使用空数组
        this.totalCount = 0; //初始化总数
        let totalCount = 0; // 检查 expiredForm 是否为数组
        if (Array.isArray(this.expiredForm)) {
          // 遍历获取的数据
          this.expiredForm.forEach((item) => {
            // 检查 approachingExpiration 是否为 true
            if (item.approachingExpiration) {
              totalCount += 1; // 总数加 1
            }
          });
        }
        this.totalCount = totalCount;
      } catch (error) {
        console.error("获取药品数据时出错:", error);
      }
    },
    async getlistRemaining() {
      try {
        // 获取药品数据
        const response = await getlistRemainingStockMedicine();
        this.remaining = response; // 保存整个返回的数据
        console.log(this.remaining);
        // 初始化临期药品总数
        this.imminentCount = 0;
        let imminentCount = 0;
        // 遍历 rows 数组，检查每个药品的 flag
        if (Array.isArray(this.remaining.rows)) {
          this.remaining.rows.forEach((item) => {
            if (item.flag === true) {
              // 检查 flag 是否为 true
              imminentCount += 1; // 临期总数加 1
            }
          });
        }
        this.imminentCount = imminentCount;
        console.log(`临期药品的总数: ${imminentCount}`);
      } catch (error) {
        console.error("获取药品数据时出错:", error);
      }
    },
  },
};
</script>

<style lang="scss" scoped>
.panel-group {
  margin-top: 18px;

  .card-panel-col {
    margin-bottom: 32px;
  }

  .card-panel {
    height: 108px;
    cursor: pointer;
    font-size: 12px;
    position: relative;
    overflow: hidden;
    color: #666;
    background: #fff;
    box-shadow: 4px 4px 40px rgba(0, 0, 0, 0.05);
    border-color: rgba(0, 0, 0, 0.05);

    &:hover {
      .card-panel-icon-wrapper {
        color: #fff;
      }

      .icon-people {
        background: #40c9c6;
      }

      .icon-message {
        background: #36a3f7;
      }

      .icon-money {
        background: #f4516c;
      }

      .icon-shopping {
        background: #34bfa3;
      }
    }

    .icon-people {
      color: #40c9c6;
    }

    .icon-message {
      color: #36a3f7;
    }

    .icon-money {
      color: #f4516c;
    }

    .icon-shopping {
      color: #34bfa3;
    }

    .card-panel-icon-wrapper {
      float: left;
      margin: 14px 0 0 14px;
      padding: 16px;
      transition: all 0.38s ease-out;
      border-radius: 6px;
    }

    .card-panel-icon {
      float: left;
      font-size: 48px;
    }

    .card-panel-description {
      float: right;
      font-weight: bold;
      margin: 26px;
      margin-left: 0px;

      .card-panel-text {
        line-height: 18px;
        color: rgba(0, 0, 0, 0.45);
        font-size: 16px;
        margin-bottom: 12px;
      }

      .card-panel-num {
        font-size: 20px;
      }
    }
  }
}

@media (max-width: 550px) {
  .card-panel-description {
    display: none;
  }

  .card-panel-icon-wrapper {
    float: none !important;
    width: 100%;
    height: 100%;
    margin: 0 !important;

    .svg-icon {
      display: block;
      margin: 14px auto !important;
      float: none !important;
    }
  }
}
</style>
