<template>  
  <div :class="className" :style="{ height, width }" ref="chartContainer"></div>  
</template>  

<script>  
import * as echarts from "echarts";  
import "echarts/theme/macarons"; // 引入主题  
import resize from "./mixins/resize"; // 假设该混入用于处理图表的自适应  
import { getlistStockType } from "@/api/medicine/medicine";  

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
    this.getlistStockType(); // 尝试在这里获取数据  
  },  
  beforeDestroy() {  
    window.removeEventListener("resize", this.resizeChart); // 清理事件监听  
    if (this.chart) {  
      this.chart.dispose();  
      this.chart = null;  
    }  
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
    async getlistStockType() {  
      try {  
        const data = await getlistStockType();  
        // console.log(data);  
        
        // 构建饼图的配置  
        const pieOption = { 
          title: {  
            text: "库存分类统计",  
            // left: "center",  
          }, 
          tooltip: {  
            trigger: "item",  
          },  
          legend: {  
            top: "5%",  
            left: "center",  
          },  
          series: [  
            {  
              name: "库存来源",  
              type: "pie",  
              radius: ["40%", "70%"],  
              avoidLabelOverlap: false,  
              itemStyle: {  
                borderRadius: 10,  
                borderColor: "#fff",  
                borderWidth: 2,  
              },  
              label: {  
                show: true,  
                position: "outside", // 改为让标签在外部显示  
              },  
              emphasis: {  
                label: {  
                  show: true,  
                  fontSize: 20,  
                  fontWeight: "bold",  
                },  
              },  
              labelLine: {  
                show: true,  
              },  
              data: data.rows.map(item => ({  
                value: item.value,  
                name: item.name,  
              })),  
            },  
          ],  
        };  

        // 设置图表选项  
        this.chart.setOption(pieOption);  
      } catch (error) {  
        console.error("获取库存数据时出错：", error);  
      }  
    },  
  },  
};  
</script>  

<style scoped>  
.chart {  
  position: relative;  
}  
</style>