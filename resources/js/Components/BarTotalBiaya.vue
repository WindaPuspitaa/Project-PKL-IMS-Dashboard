<template>
    <div>
        <apexchart ref="chart" type="bar" :options="chartOptions" :series="chartSeries" />
    </div>
</template>
  
<script>
import VueApexCharts from 'vue3-apexcharts';
import axios from "axios";

export default {
    components: {
        apexchart: VueApexCharts,
    },
    data() {
        return {
            chart: [],
            chartOptions: {
                yaxis: {
                    labels: {
                        formatter: function (value) {
                            return value.toLocaleString("id-ID", { style: "currency", currency: "IDR" });
                        }
                    },
                },
                xaxis: {
                    categories: [],
                    labels: {
                        rotate: 0,

                    },
                },
                dataLabels: {
                    enabled: false
                },
            },
            chartSeries: [
                {
                    name: 'Data Series',
                    data: [],
                },
            ],
        };
    },
    mounted() {
        this.fetchChartData();
    },
    methods: {
        click() {
            console.log(this.chartOptions);

        },
        async fetchChartData() {
            try {
                const response = await axios.get('/totalBiaya');
                console.log(response);
                this.chartSeries[0].data = response.data.series;
                console.log(this.chartOptions);
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