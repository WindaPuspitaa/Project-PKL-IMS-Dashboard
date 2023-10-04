<template>
    <div>
        <apexchart ref="chart" type="pie" :options="chartOptions" :series="series" />
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
                    width: 280,
                    type: 'pie',
                },
                legend: {
                    position: 'bottom',
                },
                colors: ['#cc2b4c', '#2d4353'],
                labels: [],
                responsive: [{
                    breakpoint: 480,
                    options: {
                        chart: {
                            width: 200
                        },
                    }
                }]
            },
        }
    },
    mounted() {
        this.fetchChartData();
    },
    methods: {
        async fetchChartData() {
            try {
                const response = await axios.get('/stokRawMat');
                console.log(response);
                this.chartOptions.labels = response.data.labels;
                this.series = response.data.values;
                this.$refs.chart.updateOptions({
                    labels: response.data.labels
                })
                // console.log(this.chartOptions);

                // this.$forceUpdate();
            } catch (error) {
                console.error('Error fetching chart data:', error);
            }
        },
    },
}
</script>