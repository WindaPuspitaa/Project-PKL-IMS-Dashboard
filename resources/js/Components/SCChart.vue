<template>
    <apexchart :options="chartOptions" :series="chartSeries" type="bar" height="400" />
</template>
  
<script>
import VueApexCharts from 'vue3-apexcharts';

export default {
    components: {
        apexchart: VueApexCharts,
    },
    props: ['chartData'],
    computed: {
        chartOptions() {
            return {
                chart: {
                    id: 'bar-chart',
                },
                xaxis: {
                    categories: this.chartData.map(item => item.material),
                },
            };
        },
        chartSeries() {
            return [
                {
                    name: 'Harga',
                    data: this.chartData.map(item => item.harga_per_item),
                },
            ];
        },
    },
};
</script>
  