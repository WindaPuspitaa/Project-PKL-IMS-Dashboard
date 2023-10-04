<template>
    <layout title="Dashboard Realisai & Deviasi">
        <div>
            <div class="row">
                <div class="col-md-3">
                    <div class="card card-danger">
                        <div class="card-body">
                            <p class="text-center">Raw Material</p>
                            <PieChartTest />
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card card-danger">
                        <div class="card-body">
                            <p class="text-center">Komponen</p>
                            <pieComponent />
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card card-danger">
                        <div class="card-body">
                            <p class="text-center">Tools</p>
                            <pieTools />
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card card-danger">
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
        </div>
    </layout>
</template>
    
<script>
import Layout from "../../Partials/Layout";
import PieChartTest from '../../Components/PieChartTest.vue';
import pieComponent from '../../Components/PieComponent.vue';
import pieTools from '../../Components/PieTools.vue';
import pieConsumable from '../../Components/PieConsumable.vue';
export default {
    components: {
        Layout,
        PieChartTest,
        pieComponent,
        pieTools,
        pieConsumable,
    },
}
</script>