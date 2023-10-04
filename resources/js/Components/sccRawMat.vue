<!-- Stacked Bar Chart Component & Fastsening -->

<template>
    <div>
        <apexchart ref="chart" type="bar" :options="chartOptions" :series="series" />

        <!-- <h2>Bar Chart</h2>
        <apexchart type="bar" :options="chartOptions" :series="barChartSeries" />

        <h2>Pie Chart</h2>
        <apexchart type="pie" :options="chartOptions" :series="pieChartSeries" /> -->
    </div>
</template>
  
<script>
import VueApexCharts from 'vue3-apexcharts';
import axios from 'axios';

export default {
    components: {
        apexchart: VueApexCharts,
    },
    data() {
        return {
            series: [],
            chartOptions: {
                chart: {
                    type: 'bar',
                    height: 350,
                    stacked: true,
                },
                responsive: [{
                    breakpoint: 480,
                    options: {
                        legend: {
                            position: 'bottom',
                            offsetX: -10,
                            offsetY: 0
                        }
                    }
                }],
                xaxis: {
                    categories: [],
                },
                fill: {
                    opacity: 1
                },
                legend: {
                    position: 'bottom'
                },
                colors: ['#cc2b4c', '#2d4353'],
                dataLabels: {
                    enabled: false
                },
            },
        };

    },
    mounted() {
        this.fetchChartData();
    },
    methods: {
        async fetchChartData() {
            try {
                const response = await axios.get('/data-sccRawMat');
                console.log(response);
                // this.series[0].data = response.data.dataSets.data;
                this.series = response.data.dataSets.map(dataSet => ({
                    name: dataSet.nama,
                    data: dataSet.data,
                }));
                this.$refs.chart.updateOptions({
                    xaxis: {
                        categories: response.data.categories
                    }
                })
                // console.log(this.chartOptions);

                // this.$forceUpdate();
            } catch (error) {
                console.error('Error fetching chart data:', error);
            }
        },
    },
};
</script>
  