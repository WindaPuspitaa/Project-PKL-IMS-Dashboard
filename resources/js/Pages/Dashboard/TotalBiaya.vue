<template>
    <layout title="Dashboard Total Biaya">
        <div>
            <div class="form-group">
                <label for="wbs_element" class="control-label" style="display: block; margin-top: 1rem;">Project:</label>
                <div class="card flex justify-content-center">
                    <Dropdown v-model="selectedWbs" :options="wbs_options" @Change="fetchChartData" optionLabel="label"
                        optionValue="value" />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-5">
                    <div class="card bg-gradient">
                        <div class="card-body">
                            <p class="text-left">Total Biaya</p>
                            <apexchart ref="pieChart" type="pie" :options="pieChartOptions" :series="pieChartSeries" />
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="card bg-gradient">
                        <div class="card-body">
                            <p class="text-left">Total Biaya</p>
                            <apexchart ref="barChart" type="bar" :options="barChartOptions" :series="barChartSeries" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <Button label="Show/Hide Table" severity="secondary" @click="toggleTable" />
            </div>

            <!-- Tabel -->
            <div v-if="showTable">
                <div class="form-group">
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
                        <Column field="purchasing_document" header="Customer PO" :sortable="false" style="min-width:10rem">
                        </Column>
                        <Column field="vendor" header="PO Vendor" :sortable="false" style="min-width:10rem"></Column>
                        <Column field="material_type" header="Material Type" :sortable="false" style="min-width:10rem">
                        </Column>
                        <Column field="material" header="Material" :sortable="false" style="min-width:10rem"></Column>
                        <Column field="description" header="Description" :sortable="false" style="min-width:10rem"></Column>
                        <Column field="specification" header="Specification" :sortable="false" style="min-width:10rem">
                        </Column>
                        <Column field="order_qty" header="PO QTY" :sortable="false" style="min-width:10rem"></Column>
                        <Column field="uom" header="UOM" :sortable="false" style="min-width:10rem"></Column>
                        <Column field="price_to_be_delivered" header="Price" :sortable="false" style="min-width:10rem">
                        </Column>
                        <Column field="currency" header="Currency" :sortable="false" style="min-width:10rem"></Column>
                    </DataTable>
                </div>
            </div>
        </div>
    </layout>
</template>
    
<script>
import Layout from "../../Partials/Layout";
import VueApexCharts from 'vue3-apexcharts';
import axios from "axios";
import PieTotalBiaya from '../../Components/PieTotalBiaya.vue';
import { getData } from '../../Api/dashboard.api';

export default {
    components: {
        Layout,
        apexchart: VueApexCharts,
        PieTotalBiaya,
    },
    props: {
        tabelPo: Object,
        wbs_elements: Array,
    },
    data() {
        return {
            // selectedWbs: '1',
            data: [],
            loading: false,
            totalData: 0,
            selectedWbs: 'M1-22041.4300003938',
            selectedCity: null,
            showTable: true,
            lazyParams: {
                page: 1
            },
            wbs: [
                { name: 'PENGADAAN 612 KERETA REPLACEMENT PT KAI', code: 'M1-22041.4300003938' },
                { name: 'AFTERSALES PGDN 612 REPLACEMENT PT KAI', code: 'M1-22041.8000122041' },
                { name: 'Project 3', code: 'LDN' },
                { name: 'Project 4', code: 'IST' },
                { name: 'Project 5', code: 'PRS' }
            ],
            barChart: [],
            barChartOptions: {
                yaxis: {
                    labels: {
                        formatter: function (value) {
                            return value.toLocaleString("id-ID", { style: "currency", currency: "IDR" });
                        }
                    },
                },
                xaxis: {
                    categories: [],
                    labels: {
                        rotate: 0,
                    },
                },
                dataLabels: {
                    enabled: false
                },
            },
            barChartSeries: [{
                name: 'Data Series',
                data: [],
            }],

            pieChart: [],
            pieChartOptions: {
                labels: [],
                legend: {
                    position: 'bottom',
                },
            },
            pieChartSeries: [],
        };
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
            this.lazyParams.page = event.page + 1;
            this.loadLazyData();
        },
        toggleTable() {
            this.showTable = !this.showTable;
        },
        async fetchChartData() {
            try {
                const response = await axios.get(`/totalBiaya/${this.selectedWbs}`);
                console.log(response);

                // Update data untuk grafik bar chart
                this.barChartSeries[0].data = response.data.series;
                this.barChartOptions.xaxis.categories = response.data.categories;

                // Update data untuk grafik pie chart
                this.pieChartOptions.labels = response.data.categories;
                this.pieChartSeries = response.data.series;

                // Update grafik
                this.$refs.barChart.updateOptions({
                    xaxis: {
                        categories: response.data.categories
                    }
                });

                this.$refs.pieChart.updateOptions({
                    labels: response.data.categories
                });

            } catch (error) {
                console.error('Error fetching chart data:', error);
            }
        },
    },
    mounted() {
        this.data = this.$page.props.tabelPo;
        this.totalData = this.$page.props.total;
        this.fetchChartData();

        console.log(this.data);
    },
};
</script>