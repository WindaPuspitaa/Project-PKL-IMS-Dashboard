<template>
    <div>
        <apexchart type="bar" height="350" :options="chartOptions" :series="series"></apexchart>
    </div>
</template>

<script>
export default {
    data() {
        return {
            chartOptions: {
                chart: {
                    type: 'bar',
                    height: 350
                },
            },
            series: [{
                name: 'Material',
                data: [100, 90, 80, 70, 60, 50, 40, 30, 20, 10]
            }],
            plotOptions: {
                bar: {
                    horizontal: false,
                    columnWidth: '55%',
                    endingShape: 'rounded'
                },
            },
            dataLabels: {
                enabled: false
            },
            stroke: {
                show: true,
                width: 2,
                colors: ['transparent']
            },
            xaxis: {
                labels: {
                    rotate: -45
                },
                categories: ['Material 1', 'Material 2', 'Material 3', 'Material 4', 'Material 5', 'Material 6', 'Material 7', 'Material 8', 'Material 9', 'Material 10'],
                tickPlacement: 'on'
            },
            yaxis: {
                title: {
                    text: '$ (thousands)'
                }
            },
            fill: {
                opacity: 1
            },
            tooltip: {
                y: {
                    formatter: function (val) {
                        return "$ " + val + " thousands"
                    }
                }
            }
        };
    },
};
</script>