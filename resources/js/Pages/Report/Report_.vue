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
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" v-model="filters.wbs_element"
                                                value="true">
                                            <label class="form-check-label">
                                                Wbs Element
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox"
                                                v-model="filters.purchasing_document" value="true">
                                            <label class="form-check-label">
                                                Purchasing Document
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" v-model="filters.vendor"
                                                value="true">
                                            <label class="form-check-label">
                                                Vendor
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" v-model="filters.material_type"
                                                value="true">
                                            <label class="form-check-label">
                                                Material Type
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" v-model="filters.material"
                                                value="true">
                                            <label class="form-check-label">
                                                Material
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" v-model="filters.description"
                                                value="true">
                                            <label class="form-check-label">
                                                Description
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" v-model="filters.specification"
                                                value="true">
                                            <label class="form-check-label">
                                                Specification
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" v-model="filters.order_qty"
                                                value="true">
                                            <label class="form-check-label">
                                                Quantity
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" v-model="filters.uom"
                                                value="true">
                                            <label class="form-check-label">
                                                UoM
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox"
                                                v-model="filters.price_to_be_delivered" value="true">
                                            <label class="form-check-label">
                                                Price
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" v-model="filters.currency"
                                                value="true">
                                            <label class="form-check-label">
                                                Currency
                                            </label>
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
                                    <div class="col">
                                        <label for="wbs_element" class="control-label"
                                            style="display: block; margin-top: 1rem;">Project:</label>
                                        <Dropdown v-model="selectedProject" :options="wbs_options" @change="filterData"
                                            optionLabel="label" optionValue="value" style="width: 400px;"
                                            placeholder="Select a Project" />
                                    </div>
                                    <div class="col">
                                        <label for="year" class="control-label"
                                            style="display: block; margin-top: 1rem;">Tahun:</label>
                                        <Dropdown v-model="selectedYear" :options="yearOptions" @change="filterDataYear"
                                            optionLabel="label" optionValue="value" style="width: 200px;"
                                            placeholder="Select a Year" />
                                    </div>
                                </div>
                                <!-- <Dropdown v-model="selectedProject" :options="wbs_options" @change="filterData"
                                    optionLabel="label" optionValue="value" placeholder="Select a Project" /> -->
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
                                <!-- <li class="nav-item"><button class="btn btn-success btn-sm" style="margin-right: 10px;"
                                        @click="exportToExcel">Export
                                        Excel</button>
                                </li> -->
                                <li><Button icon="pi pi-external-link" label="Export Excel" @click="exportToExcel" /></li>
                                <!-- <li><Button icon="pi pi-external-link" label="Export" @click="exportCSV($event)" /></li> -->
                                <!-- <li class="nav-item"><button class="btn btn-primary btn-sm">Generate</button></li> -->
                            </ul>
                        </template>
                    </Toolbar>
                    <DataTable :value="data.data" :lazy="true" :paginator="true" :rows="data.per_page"
                        v-model:filters="filters" ref="dt" :totalRecords="data.total" :loading="loading"
                        @page="onPage($event)"
                        paginatorTemplate="FirstPageLink PrevPageLink PageLinks NextPageLink LastPageLink CurrentPageReport"
                        currentPageReportTemplate="Showing {first} to {last} of {totalRecords}" responsiveLayout="scroll">
                        <template #empty>
                            No records found
                        </template>

                        <Column field="no" header="No" :sortable="false" style="min-width:2rem">
                            <template #body="slotProps">
                                {{ slotProps.index + 1 }}
                            </template>
                        </Column>
                        <Column field="wbs_element" header="WBS Element" :sortable="false" v-if="filters.wbs_element"
                            style="min-width:8rem"></Column>
                        <Column field="purchasing_document" header="Purchasing Document" :sortable="false"
                            v-if="filters.purchasing_document" style="min-width:8rem"></Column>
                        <Column field="vendor" header="Vendor" :sortable="false" v-if="filters.vendor"
                            style="min-width:8rem"></Column>
                        <Column field="material_type" header="Material Type" :sortable="false" v-if="filters.material_type"
                            style="min-width:8rem">
                        </Column>
                        <Column field="material" header="Material" :sortable="false" v-if="filters.material"
                            style="min-width:8rem"></Column>
                        <Column field="description" header="Description" :sortable="false" v-if="filters.description"
                            style="min-width:8rem"></Column>
                        <Column field="specification" header="Specification" :sortable="false" v-if="filters.specification"
                            style="min-width:8rem">
                        </Column>
                        <Column field="order_qty" header="Quantity" :sortable="false" v-if="filters.order_qty"
                            style="min-width:8rem"></Column>
                        <Column field="uom" header="UoM" :sortable="false" v-if="filters.uom" style="min-width:8rem">
                        </Column>
                        <Column field="price_to_be_delivered" header="Price" :sortable="false"
                            v-if="filters.price_to_be_delivered" style="min-width:8rem">
                        </Column>
                        <Column field="currency" header="Currency" :sortable="false" v-if="filters.currency"
                            style="min-width:8rem">
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
    },
    data() {
        return {
            data: [],
            // dataPerPage: 10,
            totalData: 0,
            loading: false,
            selectedProject: null,
            selectedYear: null,
            yearOptions: [
                { label: '2023', value: 2023 },
                { label: '2022', value: 2022 },
                { label: '2021', value: 2021 },
            ],
            lazyParams: {
                page: 1,
            },
            filters: {
                wbs_element: false,
                purchasing_document: false,
                vendor: false,
                'mt.material_type': false,
                material: false,
                description: false,
                specification: false,
                order_qty: false,
                'pt.uom': false,
                price_to_be_delivered: false,
                currency: false,
            }
        }
    },
    methods: {
        async loadLazyData() {
            this.loading = true;
            const res = await getData({ page: this.lazyParams.page, project: this.selectedProject, year: this.selectedYear })
            // console.log(res);
            this.data = res.data.data;
            this.totalData = res.data.total;

            this.loading = false;
        },
        onPage(event) {
            this.lazyParams.page = event.page + 1;
            this.loadLazyData();
        },
        onSort(event) {
            this.lazyParams = event;
            this.loadLazyData();
        },
        filterData() {
            // Panggil metode loadLazyData dengan parameter berisi nilai filter yang dipilih
            // this.loadLazyData({
            //     project: this.selectedProject,
            // });
            this.totalData = 0;
            // this.lazyParams.page = 1;
            this.loadLazyData();
        },
        filterDataYear() {
            this.totalData = 0;
            this.loadLazyData();
        },
        exportToExcel() {
            axios.post('/report/export-excel', { filters: this.filters, filterProject: this.selectedProject, filterYear: this.selectedYear }, {
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
        exportCSV() {
            this.$refs.dt.exportCSV();
        },

    },
    computed: {
        wbs_options() {
            return [
                { label: 'PENGADAAN 612 KERETA REPLACEMENT PT KAI', value: 'M1-22041.4300003938' },
                { label: 'AFTERSALES PGDN 612 REPLACEMENT PT KAI', value: 'M1-22041.8000122041' },
                { label: 'PENGADAAN KERETA', value: 'C789' },
            ];
        },
    },
    props: {
        errors: Object
    },
    mounted() {
        this.data = this.$page.props.tabelPo;
        this.totalData = this.$page.props.total;
        this.loadLazyData();
    }
}
</script>
    
<style scoped></style>
    