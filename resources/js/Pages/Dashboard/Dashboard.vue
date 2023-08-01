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
                    <div class="col-md-6">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h5 class="card-title">Chart 1</h5>
                            </div>
                            <div class="card-body">
                                <StackedColumnChart />
                            </div>
                        </div>

                        <div class="card card-primary">
                            <div class="card-header">
                                <h5 class="card-title">Chart 3</h5>
                            </div>
                            <div class="card-body">
                                <StackedColumnChart />
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h5 class="card-title">Chart 2</h5>
                            </div>
                            <div class="card-body">
                                <StackedColumnChart />
                            </div>
                        </div>

                        <div class="card card-primary">
                            <div class="card-header">
                                <h5 class="card-title">Chart 4</h5>
                            </div>
                            <div class="card-body">
                                <StackedColumnChart />
                            </div>
                        </div>
                    </div>
                </div>

                <!-- <div class="row">
                    <div class="col-lg-5">
                        <div class="card card-success">
                            <div class="card-header">
                                <h5 class="card-title">PieChart</h5>
                            </div>
                            <div class="card-body">
                                <PieChart />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="card card-success">
                            <div class="card-header">
                                <h5 class="card-title">BarChart</h5>
                            </div>
                            <div class="card-body">
                                <BarChart />
                            </div>
                        </div>
                    </div>
                </div> -->

                <!-- <div class="row">
                    <div class="col-md-12">
                        <div class="card card-success">
                            <div class="card-header">
                                <h5 class="card-title">Tabel</h5>
                                <div class="card-tools">
                                    <ul class="nav nav-pills ml-auto">
                                        <li class="nav-item"><button class="btn btn-primary btn-sm">Show/Hide Table</button>
                                        </li>
                                    </ul>
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
                </div> -->

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
            </div>
        </div>
    </layout>
</template>

<script>
import StackedColumnChart from '../../Components/SCChart.vue';
import PieChart from '../../Components/PieChart.vue';
import BarChart from '../../Components/BarChart.vue';
import BarChart2 from '../../Components/BarChart2.vue';
import Layout from "../../Partials/Layout";
export default {

    components: {
        Layout,
        StackedColumnChart,
        PieChart,
        BarChart,
        BarChart2,
    }
}
</script>