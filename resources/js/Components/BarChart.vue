<!-- BarChart.vue -->

<template>
    <div>
        <apexchart height="300" type="bar" :options="chartOptions" :series="chartSeries" />
    </div>
</template>
  
<script>
export default {
    data() {
        return {
            chartOptions: {
                xaxis: {
                    categories: ['Category 1', 'Category 2', 'Category 3', 'Category 4'],
                },
            },
            chartSeries: [
                {
                    name: 'Series 1',
                    data: [34, 28, 17, 21],
                },
            ],
        };
    },
};
</script>
  