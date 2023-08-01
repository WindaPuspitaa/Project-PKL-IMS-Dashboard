<!-- StackedColumnChart.vue -->

<template>
    <layout>
        <div>
            <apexchart type="bar" :options="chartOptions" :series="chartSeries" />
        </div>
    </layout>
</template>
  
<script>
export default {
    data() {
        return {
            chartOptions: {
                chart: {
                    stacked: true,
                },
                xaxis: {
                    categories: ['Category 1', 'Category 2', 'Category 3', 'Category 4', 'Category 5'],
                },
            },
            chartSeries: [
                {
                    name: 'Series 1',
                    data: [30, 40, 25, 50, 49],
                },
                {
                    name: 'Series 2',
                    data: [23, 12, 54, 61, 32],
                },
            ],
        };
    },
};
</script>
  