<template>
    <layout title="Dashboard">
        <div>
            <div class="container-fluid">

                <div class="row">
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
                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box">
                            <span class="info-box-icon bg-info elevation-1">
                                <i class="ion ion-bag"></i>

                            </span>
                            <div class="info-box-content">
                                <h3>150</h3>
                                <p>Label</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box">
                            <span class="info-box-icon bg-info elevation-1">
                                <i class="ion ion-bag"></i>

                            </span>
                            <div class="info-box-content">
                                <h3>150</h3>
                                <p>Label</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box">
                            <span class="info-box-icon bg-info elevation-1">
                                <i class="ion ion-bag"></i>

                            </span>
                            <div class="info-box-content">
                                <h3>150</h3>
                                <p>Label</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box">
                            <span class="info-box-icon bg-danger elevation-1">
                                <i class="ion ion-bag"></i>

                            </span>
                            <div class="info-box-content">
                                <h3>150</h3>
                                <p>Label</p>
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
                                <p class="text-left">Chart 1</p>
                                <BarChartTest />
                            </div>
                        </div>

                        <div class="card card-primary">
                            <!-- <div class="card-header">
                                <h5 class="card-title">Chart 3</h5>
                            </div> -->
                            <div class="card-body">
                                <p class="text-left">Chart 3</p>
                                <StackedColumnChart />
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="card card-primary">
                            <!-- <div class="card-header">
                                <h5 class="card-title">Chart 2</h5>
                            </div> -->
                            <div class="card-body">
                                <p class="text-left">Chart 2</p>
                                <StackedColumnChart />
                            </div>
                        </div>

                        <div class="card card-primary">
                            <!-- <div class="card-header">
                                <h5 class="card-title">Chart 4</h5>
                            </div> -->
                            <div class="card-body">
                                <p class="text-left">Chart 4</p>
                                <StackedColumnChart />
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
                                <PieChart />
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
                                <BarChart />
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
                    <div class="col-md-3">
                        <div class="card card-danger">
                            <!-- <div class="card-header">
                                <h5 class="card-title">Pie Chart 1</h5>
                            </div> -->
                            <div class="card-body">
                                <p class="text-left">Raw Material</p>
                                <PieChart2 />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card card-danger">
                            <!-- <div class="card-header">
                                <h5 class="card-title">Pie Chart 2</h5>
                            </div> -->
                            <div class="card-body">
                                <p class="text-left">Komponen</p>
                                <PieChart2 />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card card-danger">
                            <!-- <div class="card-header">
                                <h5 class="card-title">Pie Chart 3</h5>
                            </div> -->
                            <div class="card-body">
                                <p class="text-left">Tools</p>
                                <PieChart2 />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card card-danger">
                            <!-- <div class="card-header">
                                <h5 class="card-title">Pie Chart 4</h5>
                            </div> -->
                            <div class="card-body">
                                <p class="text-left">Consumable</p>
                                <PieChart2 />
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
                                <p class="text-left">Top 10 Expensive Raw Material</p>
                                <BarChart2 />
                            </div>
                        </div>

                        <div class="card card-primary">

                            <div class="card-body">
                                <p class="text-center">Top 10 Expensive Raw Material</p>
                                <BarChart2 />
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="card card-primary">

                            <div class="card-body">
                                <p class="text-center">Top 10 Expensive Raw Material</p>
                                <BarChart2 />
                            </div>
                        </div>

                        <div class="card card-primary">

                            <div class="card-body">
                                <p class="text-center">Top 10 Expensive Raw Material</p>
                                <BarChart2 />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-success">
                            <div class="card-header">
                                <h5 class="card-title">Procurement</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-5">
                                        <p class="text-center">Procurement (Mat. Type)</p>
                                        <PieChart />
                                    </div>
                                    <div class="col-md-7">
                                        <BarChart />
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
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
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-danger">
                            <div class="card-header">
                                <h5 class="card-title">Inventory</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-3">
                                        <PieChart />
                                    </div>
                                    <div class="col-md-3">
                                        <PieChart />
                                    </div>
                                    <div class="col-md-3">
                                        <PieChart />
                                    </div>
                                    <div class="col-md-3">
                                        <PieChart />
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
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
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-success">
                            <div class="card-header">
                                <h5 class="card-title">Top 10 Kebutuhan Material</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <p class="text-center">Top 10 Expensive Raw Material</p>
                                        <BarChart2 />
                                    </div>
                                    <div class="col-md-6">
                                        <p class="text-center">Top 10 Expensive Component</p>
                                        <BarChart2 />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <p class="text-center">Top 10 Expensive Tools</p>
                                        <BarChart2 />
                                    </div>
                                    <div class="col-md-6">
                                        <p class="text-center">Top 10 Expensive Consumable</p>
                                        <BarChart2 />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <p class="text-left">Raw Material</p>
                                <PieChart2 />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <p class="text-left">Raw Material</p>
                                <PieChart2 />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </layout>
</template>

<script>
import StackedColumnChart from '../../Components/SCChart.vue';
import PieChart from '../../Components/PieChart.vue';
import PieChart2 from '../../Components/PieChart2.vue';
import BarChart from '../../Components/BarChart.vue';
import BarChart2 from '../../Components/BarChart2.vue';
import BarChartTest from '../../Components/BarChartTest.vue';
import Chart from '../Chart/BarChart.vue';
import Layout from "../../Partials/Layout";
import { Inertia } from "@inertiajs/inertia";
import axios from 'axios';
export default {

    components: {
        Layout,
        StackedColumnChart,
        PieChart,
        PieChart2,
        BarChart,
        BarChart2,
        BarChartTest,
        Chart,
    },
    data() {
        return {
            chartData: {
                labels: [],
                values: [],
            },
        };
    },
    mounted() {
        this.fetchChartData();
    },
    methods: {
        async fetchChartData() {
            try {
                const response = await axios.get('/chart-data');
                console.log(response);
                this.chartData.labels = response.data.labels;
                this.chartData.values = [1, 2, 3, 5];
            } catch (error) {
                console.error('Error fetching chart data:', error);
            }
        },
    },
};
</script>