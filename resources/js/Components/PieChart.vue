<!-- PieChart.vue -->

<template>
    <div>
        <apexchart type="pie" :options="chartOptions" :series="chartSeries" />
    </div>
</template>
  
<script>
export default {
    data() {
        return {
            chartOptions: {
                labels: ['Category 1', 'Category 2', 'Category 3', 'Category 4'],
            },
            chartSeries: [34, 28, 17, 21],
        };
    },
};
</script>
  