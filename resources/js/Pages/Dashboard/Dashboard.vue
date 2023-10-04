<template>
    <layout title="Dashboard">
        <div>
            <div class="container-fluid">

                <div class="row">
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-info">
                            <div class="inner">
                                <h3>{{ stok }}</h3>
                                <p>Stok Material</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-cube"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-info">
                            <div class="inner">
                                <h3>150</h3>
                                <p>Label</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-bag"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-info">
                            <div class="inner">
                                <h3>150</h3>
                                <p>Label</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-bag"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-info">
                            <div class="inner">
                                <h3>150</h3>
                                <p>Label</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-bag"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card bg-gradient">
                            <div class="card-header">
                                <h5 class="card-title">Tabel</h5>
                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Kolom 1</th>
                                            <th>Kolom 2</th>
                                            <th>Kolom 3</th>
                                            <th>Kolom 4</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1.</td>
                                            <td>Baris 1 Kolom 2</td>
                                            <td>Baris 1 Kolom 3</td>
                                            <td>Baris 1 Kolom 4</td>
                                            <td>Baris 1 Kolom 5</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer">
                                <ul class="pagination pagination-sm m-0 float-left">
                                    <li class="page-item"><a href="#" class="page-link">>></a></li>
                                    <li class="page-item"><a href="#" class="page-link">1</a></li>
                                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                                    <li class="page-item"><a href="#" class="page-link">3</a></li>
                                    <li class="page-item"><a href="#" class="page-link">>></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="card card-primary">
                            <!-- <div class="card-header">
                                <h5 class="card-title">Chart 1</h5>
                            </div> -->
                            <div class="card-body">
                                <p class="text-center">Raw Material</p>
                                <!-- <StackedColumnChart /> -->
                                <!-- <bar-chart-test :chart-data="chartData" /> -->
                                <!-- <div v-for="(typeData, typeName) in groupedData" :key="typeName">
                                    <StackedColumnChart :chartData="typeData" />
                                </div> -->
                                <apexchart type="bar" :options="chartOptions" :series="chartData"></apexchart>
                                <!-- <sccRawMat /> -->
                            </div>
                        </div>

                        <div class="card card-primary">
                            <!-- <div class="card-header">
                                <h5 class="card-title">Chart 3</h5>
                            </div> -->
                            <div class="card-body">
                                <p class="text-center">Tools</p>
                                <!-- <StackedColumnChart /> -->
                                <!-- <ChartTest :chart-data="chartData" /> -->
                                <sccTools />
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="card card-primary">
                            <!-- <div class="card-header">
                                <h5 class="card-title">Chart 2</h5>
                            </div> -->
                            <div class="card-body">
                                <p class="text-center">Component & Fastening</p>
                                <!-- <StackedColumnChart /> -->
                                <Chart />
                            </div>
                        </div>

                        <div class="card card-primary">
                            <!-- <div class="card-header">
                                <h5 class="card-title">Chart 4</h5>
                            </div> -->
                            <div class="card-body">
                                <p class="text-center">Consumable</p>
                                <sccConsumable />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-5">
                        <div class="card bg-gradient">
                            <!-- <div class="card-header">
                                <h5 class="card-title">PieChart</h5>
                            </div> -->
                            <div class="card-body">
                                <p class="text-left">Pie Chart</p>
                                <PieTotalBiaya />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="card bg-gradient">
                            <!-- <div class="card-header">
                                <h5 class="card-title">BarChart</h5>
                            </div> -->
                            <div class="card-body">
                                <p class="text-left">Bar Chart</p>
                                <BarTotalBiaya />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card bg-gradient">
                            <div class="card-header">
                                <h5 class="card-title">Tabel</h5>
                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Customer PO</th>
                                            <th>PO Vendor</th>
                                            <th>Material Type</th>
                                            <th>Material</th>
                                            <th>Description</th>
                                            <th>Specification</th>
                                            <th>PO QTY</th>
                                            <th>UOM</th>
                                            <th>Price</th>
                                            <th>Currency</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="po in tabelPo" :key="po.purchasing_document">
                                            <td>{{ po.purchasing_document }}</td>
                                            <td>{{ po.vendor }}</td>
                                            <td>{{ po.material_type }}</td>
                                            <td>{{ po.material }}</td>
                                            <td>{{ po.description }}</td>
                                            <td>{{ po.specification }}</td>
                                            <td>{{ po.order_qty }}</td>
                                            <td>{{ po.uom }}</td>
                                            <td>{{ po.price_to_be_delivered }}</td>
                                            <td>{{ po.currency }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer">
                                <ul class="pagination pagination-sm m-0 float-left">
                                    <li class="page-item"><a href="#" class="page-link">>></a></li>
                                    <li class="page-item"><a href="#" class="page-link">1</a></li>
                                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                                    <li class="page-item"><a href="#" class="page-link">3</a></li>
                                    <li class="page-item"><a href="#" class="page-link">>></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        <div class="card card-danger">
                            <!-- <div class="card-header">
                                <h5 class="card-title">Pie Chart 1</h5>
                            </div> -->
                            <div class="card-body">
                                <p class="text-center">Raw Material</p>
                                <PieChartTest />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card card-danger">
                            <!-- <div class="card-header">
                                <h5 class="card-title">Pie Chart 2</h5>
                            </div> -->
                            <div class="card-body">
                                <p class="text-center">Komponen</p>
                                <pieComponent />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card card-danger">
                            <!-- <div class="card-header">
                                <h5 class="card-title">Pie Chart 3</h5>
                            </div> -->
                            <div class="card-body">
                                <p class="text-center">Tools</p>
                                <pieTools />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card card-danger">
                            <!-- <div class="card-header">
                                <h5 class="card-title">Pie Chart 4</h5>
                            </div> -->
                            <div class="card-body">
                                <p class="text-center">Consumable</p>
                                <pieConsumable />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card bg-gradient">
                            <div class="card-header">
                                <h5 class="card-title">Tabel</h5>
                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Kolom 1</th>
                                            <th>Kolom 2</th>
                                            <th>Kolom 3</th>
                                            <th>Kolom 4</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1.</td>
                                            <td>Baris 1 Kolom 2</td>
                                            <td>Baris 1 Kolom 3</td>
                                            <td>Baris 1 Kolom 4</td>
                                            <td>Baris 1 Kolom 5</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer">
                                <ul class="pagination pagination-sm m-0 float-left">
                                    <li class="page-item"><a href="#" class="page-link">>></a></li>
                                    <li class="page-item"><a href="#" class="page-link">1</a></li>
                                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                                    <li class="page-item"><a href="#" class="page-link">3</a></li>
                                    <li class="page-item"><a href="#" class="page-link">>></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="card card-primary">

                            <div class="card-body">
                                <p class="text-center">Top 10 Expensive Raw Material</p>
                                <BarChartTest />
                            </div>
                        </div>

                        <div class="card card-primary">

                            <div class="card-body">
                                <p class="text-center">Top 10 Expensive Tools</p>
                                <BarTopTools />
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="card card-primary">

                            <div class="card-body">
                                <p class="text-center">Top 10 Expensive Component & Fastening</p>
                                <BarChart2 />
                            </div>
                        </div>

                        <div class="card card-primary">

                            <div class="card-body">
                                <p class="text-center">Top 10 Expensive Consumable</p>
                                <BarTopConsum />
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </layout>
</template>

<script>
import VueApexCharts from 'vue3-apexcharts';
import StackedColumnChart from '../../Components/SCChart.vue';
import BarChart2 from '../../Components/BarChart2.vue';
import BarChartTest from '../../Components/BarChartTest.vue';
import ChartTest from '../../Components/ChartTest.vue';
import PieChartTest from '../../Components/PieChartTest.vue';
import sccRawMat from '../../Components/sccRawMat.vue';
import sccConsumable from '../../Components/sccConsumable.vue';
import sccTools from '../../Components/sccTools.vue';
import PieTotalBiaya from '../../Components/PieTotalBiaya.vue';
import BarTotalBiaya from '../../Components/BarTotalBiaya.vue';
import pieComponent from '../../Components/PieComponent.vue';
import pieTools from '../../Components/PieTools.vue';
import pieConsumable from '../../Components/PieConsumable.vue';
import BarTopTools from '../../Components/TopTools.vue';
import BarTopConsum from '../../Components/TopConsum.vue';
import Chart from '../Chart/BarChart.vue';
import Layout from "../../Partials/Layout";
import { Inertia } from "@inertiajs/inertia";
import axios from 'axios';
export default {

    components: {
        Layout,
        apexchart: VueApexCharts,
        StackedColumnChart,
        BarChart2,
        BarChartTest,
        ChartTest,
        PieChartTest,
        sccRawMat,
        sccConsumable,
        sccTools,
        PieTotalBiaya,
        BarTotalBiaya,
        pieComponent,
        pieTools,
        pieConsumable,
        BarTopTools,
        BarTopConsum,
        Chart
    },
    props: {
        stok: Number,
        tabelPo: Array,
        totalBiaya: Array,
        chartData: Object,
    },

    // data() {
    //     return {
    //         chartOptions: {
    //             chart: {
    //                 type: 'bar',
    //             },
    //             xaxis: {
    //                 categories: this.totalBiaya.map(item => item.material_type), // 
    //             },
    //             yaxis: {
    //                 title: {
    //                     text: 'Total Akumulasi Harga',
    //                 },
    //             },
    //             title: {
    //                 text: 'Grafik Total Akumulasi Harga berdasarkan Jenis Material',
    //                 align: 'center',
    //             },
    //             tooltip: {
    //                 y: {
    //                     formatter: function (value) {
    //                         return 'Rp ' + value.toFixed(2);
    //                     },
    //                 },
    //             },

    //         },
    //     };
    // },

    // data() {
    //     return {
    //         chartData: {
    //             labels: [],
    //             values: [],
    //         },
    //     };
    // },
    // mounted() {
    //     this.fetchChartData();
    //     console.log(this.topExp);
    // },
    // methods: {
    //     async fetchChartData() {
    //         try {
    //             const response = await axios.get('/chart-data');
    //             // console.log(response);
    //             this.chartData.labels = response.data.labels;
    //             this.chartData.values = response.data.values;
    //             // console.log(this.chartData);
    //         } catch (error) {
    //             console.error('Error fetching chart data:', error);
    //         }
    //     },



    // },
    // computed: {
    //     groupedData() {
    //         const grouped = {};
    //         this.topExp.forEach(item => {
    //             const typeName = item.material_type;
    //             if (!grouped[typeName]) {
    //                 grouped[typeName] = [];
    //             }
    //             grouped[typeName].push({ name: item.material, price: item.harga_per_item });
    //         });
    //         return grouped;
    //     },
    // },
};
</script>