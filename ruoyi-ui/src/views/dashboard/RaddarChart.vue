<template>
  <div :class="className" :style="{ height, width }" ref="chartContainer"></div>
</template>

<script>
import * as echarts from "echarts";
import "echarts/theme/macarons"; // 引入主题
import resize from "./mixins/resize";
import { getlistSevenDayOperate } from "@/api/medicine/medicine";

export default {
  mixins: [resize],
  props: {
    className: {
      type: String,
      default: "chart",
    },
    width: {
      type: String,
      default: "100%",
    },
    height: {
      type: String,
      default: "300px",
    },
  },
  data() {
    return {
      chart: null,
      data: [],
    };
  },
  mounted() {
    this.initChart();
    window.addEventListener("resize", this.resizeChart); // 增加窗口缩放事件
  },
  beforeDestroy() {
    window.removeEventListener("resize", this.resizeChart); // 清理事件监听
    if (this.chart) {
      this.chart.dispose();
      this.chart = null;
    }
  },
  created() {
    this.getlistSevenDayOption();
  },
  methods: {
    initChart() {
      this.chart = echarts.init(this.$refs.chartContainer, "macarons");
    },
    resizeChart() {
      if (this.chart) {
        this.chart.resize(); // 调整图表大小
      }
    },
    /**获取数据 */
    async getlistSevenDayOption() {
      const data = await getlistSevenDayOperate();
      // console.log(data);
      const option = {
        title: {
          display: true,
          text: "近七天操作次数统计",
          color: "black", // 设置颜色为黑色
        },
        xAxis: {
          type: "category",
          data: data.rows.map((item) => item.date),
        },
        yAxis: {
          type: "value",
        },
        series: [
          {
            data: data.rows.map((item) => item.operation_count),
            type: "line",
            smooth: true,
          },
        ],
      };
      this.chart.setOption(option);
    },
  },
};
</script>

<style scoped>
.chart {
  position: relative;
}
</style>
