<template>
    <layout title="Report">
        <div>
            <!-- <div
                style="background-color:white;height: 550px;width: 100%;display: flex;justify-content: center;align-items: center;flex-direction: "> -->
            <!-- <label for="">Selamat Datang</label> -->
            <!-- <span class="brand-text font-weight-light text" style="font-size: 75px; color: #007bff;">Report</span> -->
            <!-- <small><b>Made By Tim Divisi Teknologi Informasi</b> </small> 
            </div>-->
            <div class="container-fuid">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">TAMPILAN DATA</h5>
                            </div>
                            <div class="card-body"></div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">FILTER DATA</h5>
                            </div>
                            <div class="card-body"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">HASIL</h5>
                                <div class="card-tools">
                                    <ul class="nav nav-pills ml-auto">
                                        <li class="nav-item"><button class="btn btn-success btn-sm"
                                                style="margin-right: 10px;">Export Excel</button>
                                        </li>
                                        <li class="nav-item"><button class="btn btn-primary btn-sm">Generate</button></li>
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
                </div>
            </div>
        </div>
    </layout>
</template>
    
<script>
import AppHeader from "../../Partials/AppHeader";
import Footer from "../../Partials/Footer";
import Layout from "../../Partials/Layout";
import ErrorsAndMessages from "../../Partials/ErrorsAndMessages";
import { usePage } from "@inertiajs/inertia-vue3";
import { Inertia } from "@inertiajs/inertia";
import { computed, inject } from "vue";
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import ColumnGroup from 'primevue/columngroup';

export default {
    name: "Posts",
    components: {
        ErrorsAndMessages,
        AppHeader,
        Footer,
        Layout,
        DataTable,
        Column,
        ColumnGroup,
    },
    data() {
        return {
            data: [],
            filters: {
                'DocNo': { value: '', matchMode: 'contains' },
                'ItName': { value: '', matchMode: 'contains' },
                'Jum': { value: '', matchMode: 'contains' },
                'Tgl': { value: '', matchMode: 'contains' },
                'Uom': { value: '', matchMode: 'contains' },
                'Bom': { value: '', matchMode: 'contains' },
            },
            lazyParams: {},
            loading: false
        }
    },
    methods: {
        loadLazyData() {
            this.loading = true;
            axios.post('/so', this.lazyParams).then(response => {
                this.data = response.data;
                this.loading = false;
            })
        },
        onPage(event) {
            this.lazyParams = event;
            this.loadLazyData();
        },
        onSort(event) {
            this.lazyParams = event;
            this.loadLazyData();
        },
        onFilter() {
            this.lazyParams.filters = this.filters;
            this.loadLazyData();
        }
    },
    props: {
        errors: Object
    },
    setup() {

        // const data = computed(() => usePage().props.value.data);


        // return {
        //     data
        // }
    },
    mounted() {
        // this.data = this.$page.props.data;
    }
}
</script>
    
<style scoped>
.action-btn {
    margin-left: 12px;
    font-size: 13px;
}

.article {
    margin-top: 20px;
}

::v-deep(.so-contract) {
    background-color: rgba(0, 0, 0, .15) !important;
}
</style>
    