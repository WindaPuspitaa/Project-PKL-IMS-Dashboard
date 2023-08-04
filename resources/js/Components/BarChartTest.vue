<template>
    <div>
        <button @click="click">asasa</button>
        <apexchart type="bar" :options="chartOptions" :series="chartSeries" />
    </div>
</template>
  
<script>
import VueApexCharts from 'vue3-apexcharts';

export default {
    components: {
        apexchart: VueApexCharts,
    },

    // methods: {
    //     click() {
    //         this.chartSeries[0].data = this.data.labels
    //     }

    // },

    data() {
        return {
            chart: [],
            chartOptions: {
                xaxis: {
                    categories: [],
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
        async fetchChartData() {
            try {
                const response = await axios.get('/chart-data');
                console.log(this.chartOptions);
                this.chart = ['ww', 'ee', 'ss'];
                this.chartSeries[0].data = response.data.values;
                console.log(this.chartOptions);
            } catch (error) {
                console.error('Error fetching chart data:', error);
            }
        },
    },
};
</script>
  