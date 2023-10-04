<template>
    <layout title="Report">
        <div>
            <div class="container-fuid">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">TAMPILAN DATA</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="flex align-items-center">
                                            <Checkbox v-model="column" inputId="ingredient1" name="column"
                                                value="wbs_element" />
                                            <label for="ingredient1" class="ml-2"> Wbs Element </label>
                                        </div>
                                        <div class="flex align-items-center">
                                            <Checkbox v-model="column" inputId="ingredient2" name="column"
                                                value="purchasing_document" />
                                            <label for="ingredient2" class="ml-2"> Purchasing Document </label>
                                        </div>
                                        <div class="flex align-items-center">
                                            <Checkbox v-model="column" inputId="ingredient3" name="column" value="vendor" />
                                            <label for="ingredient3" class="ml-2"> Vendor </label>
                                        </div>
                                        <div class="flex align-items-center">
                                            <Checkbox v-model="column" inputId="ingredient4" name="column"
                                                value="material_type" />
                                            <label for="ingredient4" class="ml-2"> Material Type </label>
                                        </div>
                                        <div class="flex align-items-center">
                                            <Checkbox v-model="column" inputId="ingredient5" name="column"
                                                value="material" />
                                            <label for="ingredient4" class="ml-2"> Material </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="flex align-items-center">
                                            <Checkbox v-model="column" inputId="ingredient1" name="column"
                                                value="description" />
                                            <label for="ingredient1" class="ml-2"> Description </label>
                                        </div>
                                        <div class="flex align-items-center">
                                            <Checkbox v-model="column" inputId="ingredient2" name="column"
                                                value="specification" />
                                            <label for="ingredient2" class="ml-2"> Specificstion </label>
                                        </div>
                                        <div class="flex align-items-center">
                                            <Checkbox v-model="column" inputId="ingredient3" name="column"
                                                value="order_qty" />
                                            <label for="ingredient3" class="ml-2"> Quantity </label>
                                        </div>
                                        <div class="flex align-items-center">
                                            <Checkbox v-model="column" inputId="ingredient4" name="column" value="uom" />
                                            <label for="ingredient4" class="ml-2"> UoM </label>
                                        </div>
                                        <div class="flex align-items-center">
                                            <Checkbox v-model="column" inputId="ingredient5" name="column"
                                                value="price_to_be_delivered" />
                                            <label for="ingredient4" class="ml-2"> Price </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">FILTER DATA</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="form-check">
                                        <RadioButton v-model="selectedFilter" value="all" inputId="allFilter"
                                            name="filterOption" />
                                        <label class="form-check-label" for="allFilter">
                                            All
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <RadioButton v-model="selectedFilter" value="top10" inputId="top10Filter"
                                            name="filterOption" />
                                        <label class="form-check-label" for="top10Filter">
                                            Top 10
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <RadioButton v-model="selectedFilter" value="top50" inputId="top50Filter"
                                            name="filterOption" />
                                        <label class="form-check-label" for="top50Filter">
                                            Top 50
                                        </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="year" class="control-label"
                                            style="display: block; margin-top: 1rem;">Tahun:</label>
                                        <Dropdown v-model="selectedYear" :options="yearOptions" optionLabel="label"
                                            optionValue="value" placeholder="Select a Year" />
                                    </div>
                                    <div class="col">
                                        <label for="wbs_element" class="control-label"
                                            style="display: block; margin-top: 1rem;">Project:</label>
                                        <Dropdown v-model="selectedProject" :options="wbs_options" @input="filterData"
                                            optionLabel="label" optionValue="value" placeholder="Select a Project" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <Toolbar>
                        <template #start>
                            <h5>HASIL</h5>
                        </template>
                        <template #end>
                            <ul class="nav nav-pills ml-auto">
                                <li class="nav-item"><button class="btn btn-success btn-sm" style="margin-right: 10px;"
                                        @click="exportToExcel">Export
                                        Excel</button>
                                </li>
                                <li class="nav-item"><button class="btn btn-primary btn-sm">Generate</button></li>
                            </ul>
                        </template>
                    </Toolbar>
                    <DataTable :value="data.data" :lazy="true" :paginator="true" :rows="dataPerPage"
                        v-model:filters="filters" ref="dt" :totalRecords="data.total" :loading="loading"
                        @page="onPage($event)"
                        paginatorTemplate="FirstPageLink PrevPageLink PageLinks NextPageLink LastPageLink CurrentPageReport"
                        currentPageReportTemplate="Showing {first} to {last} of {totalRecords}" responsiveLayout="scroll">
                        <template #empty>
                            No records found
                        </template>

                        <Column field="no" header="No" :sortable="false" style="min-width:2rem">
                            <template #body="slotProps">
                                {{ (((lazyParams.page - 1) * dataPerPage) + slotProps.index) + 1 }}
                            </template>
                        </Column>
                        <Column field="wbs_element" header="WBS Element" :sortable="false" style="min-width:8rem"></Column>
                        <Column field="purchasing_document" header="Purchasing Document" :sortable="false"
                            style="min-width:8rem"></Column>
                        <Column field="vendor" header="Vendor" :sortable="false" style="min-width:8rem"></Column>
                        <Column field="material_type" header="Material Type" :sortable="false" style="min-width:8rem">
                        </Column>
                        <Column field="material" header="Material" :sortable="false" style="min-width:8rem"></Column>
                        <Column field="description" header="Description" :sortable="false" style="min-width:8rem"></Column>
                        <Column field="specification" header="Specification" :sortable="false" style="min-width:8rem">
                        </Column>
                        <Column field="order_qty" header="Quantity" :sortable="false" style="min-width:8rem"></Column>
                        <Column field="uom" header="UoM" :sortable="false" style="min-width:8rem">
                        </Column>
                        <Column field="price_to_be_delivered" header="Price" :sortable="false" style="min-width:8rem">
                        </Column>
                    </DataTable>
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
import Toolbar from 'primevue/toolbar';
import axios from 'axios';
import { getData } from '../../Api/report.api';
import Dropdown from 'primevue/dropdown';
import RadioButton from 'primevue/radiobutton';
import Checkbox from 'primevue/checkbox';

export default {
    name: "Report",
    components: {
        ErrorsAndMessages,
        AppHeader,
        Footer,
        Layout,
        DataTable,
        Column,
        ColumnGroup,
        Dropdown,
        RadioButton,
        Checkbox,
    },
    data() {
        return {
            data: [],
            dataPerPage: 10,
            totalData: 0,
            selectedProject: null,
            selectedYear: null,
            yearOptions: [
                { label: '2023', value: 2023 },
                { label: '2022', value: 2022 },
                { label: '2021', value: 2021 },
            ],
            column: null,
            loading: false,
            lazyParams: {
                page: 1,
            },

        }
    },
    methods: {
        async loadLazyData() {
            this.loading = true;
            const res = await getData({ page: this.lazyParams.page })
            // console.log(res);
            this.data = res.data.data;
            this.totalData = res.data.total;

            this.loading = false;
        },
        onPage(event) {
            this.lazyParams = event;
            this.loadLazyData();
        },
        onSort(event) {
            this.lazyParams = event;
            this.loadLazyData();
        },
        filterData() {
            // Panggil metode loadLazyData dengan parameter berisi nilai filter yang dipilih
            this.loadLazyData({
                project: this.selectedProject,
            });
        },
        exportToExcel() {
            axios.get('/report/export-excel', {
                responseType: 'blob', // Set the response type to 'blob'
            })
                .then(response => {
                    // Mengatur header untuk pengunduhan file Excel
                    const blob = new Blob([response.data], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
                    const link = document.createElement('a');
                    link.href = window.URL.createObjectURL(blob);
                    link.setAttribute('download', 'report.xlsx');
                    document.body.appendChild(link);
                    link.click();
                })
                .catch(error => {
                    console.error('Error:', error);
                });
        },
    },
    computed: {
        wbs_options() {
            return [
                { label: 'PENGADAAN 612 KERETA REPLACEMENT PT KAI', value: 'M1-22041.4300003938' },
                { label: 'AFTERSALES PGDN 612 REPLACEMENT PT KAI', value: 'M1-22041.8000122041' },
                { label: 'Nama Proyek 3', value: 'C789' },
            ];
        },
    },
    props: {
        errors: Object
    },
    mounted() {
        this.data = this.$page.props.tabelPo;
        this.totalData = this.$page.props.total;
    }
}
</script>
    
<style scoped></style>
    