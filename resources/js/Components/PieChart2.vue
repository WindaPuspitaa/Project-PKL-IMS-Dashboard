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
                labels: ['Akan dibeli', 'Stok'],
                legend: {
                    position: "bottom",
                },
            },
            chartSeries: [71, 29],
        };
    },
};
</script>
  