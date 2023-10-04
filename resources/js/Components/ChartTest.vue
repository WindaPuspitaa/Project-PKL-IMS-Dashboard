<template>
    <div>
        <apexchart ref="chart" type="bar" :options="chartOptions" :series="seriesData" />

        <!-- <h2>Bar Chart</h2>
        <apexchart type="bar" :options="chartOptions" :series="barChartSeries" />

        <h2>Pie Chart</h2>
        <apexchart type="pie" :options="chartOptions" :series="pieChartSeries" /> -->
    </div>
</template>
  
<script>
import VueApexCharts from 'vue3-apexcharts';

export default {
    components: {
        apexchart: VueApexCharts,
    },
    props: {
        chartData: Object,
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
            },
        };

    },
    mounted() {
        this.processChartData();
    },
    methods: {
        processChartData() {
            const categories = this.chartData.categories;

            this.chartOptions.xaxis.categories = categories;

            console.log(this.chartData);

            this.series = this.chartData.dataSets.map(dataSet => ({
                name: dataSet.nama,
                data: dataSet.data,
            }));

            this.$refs.chart.updateSeries(this.series);
            this.$refs.chart.updateOptions(this.chartOptions);
        },
    },

    // computed: {
    //     chartOptions() {
    //         return {
    //             chart: {
    //                 height: 350,
    //                 type: 'bar',
    //             },
    //             xaxis: {
    //                 categories: [],
    //             },
    //         };

    //     },
    //     seriesData: [],
    // },

    // barChartSeries() {
    //     return this.barChartData.datasets.map(dataset => ({
    //         name: dataset.label,
    //         data: dataset.data,
    //     }));
    // },
    // pieChartSeries() {
    //     return this.pieChartData.datasets[0].data;
    // },

};
</script>
  