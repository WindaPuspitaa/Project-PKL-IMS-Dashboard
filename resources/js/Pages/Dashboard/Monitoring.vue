<template>
    <layout title="Monitoring">
        <div>
            <div class="row">
                <div class="col-lg-5">
                    <div class="card bg-gradient">
                        <div class="card-body">
                            <p class="text-left">Status</p>
                            <apexchart ref="pieChart" type="pie" :options="pieChartOptions" :series="pieChartSeries" />
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="card bg-gradient">
                        <div class="card-body">
                            <p class="text-left">Actual VS Target</p>
                            <apexchart ref="mixedChart" :options="chartOptions" :series="chartSeries" type="line"
                                height="350" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- <div class="form-group">
                <label for="wbs_element" class="control-label" style="display: block; margin-top: 1rem;">Status:</label>
                <div class="card flex justify-content-center">
                    <Dropdown v-model="selectedStatus" :options="statuses" @Change="filterStatus"
                        placeholder="Select a Status">
                        <template #body="slotProps">
                            <span :class="['status-badge', getSeverity(slotProps.data.status)]">
                                {{ slotProps.data.status }}
                            </span>
                        </template>
                    </Dropdown>
                </div>
            </div> -->

            <div class="form-group">
                <div class="row">
                    <div class="col-2">
                        <Button label="Show/Hide Table" severity="secondary" @click="toggleTable" />
                    </div>
                    <div class="col-10">
                        <Dropdown v-model="selectedStatus" :options="statuses" @Change="filterStatus" placeholder="Status"
                            style="width: 200px;">
                        </Dropdown>
                    </div>
                </div>
            </div>

            <!-- Tabel -->
            <div v-if="showTable">
                <div class="form-group">
                    <DataTable :value="data" :lazy="true" :paginator="true" :rows="dataPerPage" ref="dt"
                        :totalRecords="totalData" :totalData="total" :loading="loading" @page="onPage($event)"
                        paginatorTemplate="FirstPageLink PrevPageLink PageLinks NextPageLink LastPageLink CurrentPageReport"
                        currentPageReportTemplate="Showing {first} to {last} of {totalRecords}" responsiveLayout="scroll">
                        <Column field="no" header="No" :sortable="false" style="min-width:2rem">
                            <template #body="slotProps">
                                {{ slotProps.index + 1 }}
                            </template>
                        </Column>
                        <Column field="pr" header="PR" :sortable="false" style="min-width:8rem"></Column>
                        <Column field="pr_date" header="PR DATE" :sortable="false" style="min-width:8rem"></Column>
                        <Column field="po" header="PO" :sortable="false" style="min-width:8rem"></Column>
                        <Column field="nama_vendor" header="VENDOR" :sortable="false" style="min-width:8rem"></Column>
                        <Column field="material" header="MATERIAL" :sortable="false" style="min-width:8rem"></Column>
                        <Column field="spesifikasi" header="SPECIFICATION" :sortable="false" style="min-width:8rem">
                        </Column>
                        <Column field="start_date" header="START DATE" :sortable="false" style="min-width:8rem"></Column>
                        <Column field="end_date" header="END DATE" :sortable="false" style="min-width:8rem"></Column>
                        <Column field="uom" header="UOM" :sortable="false" style="min-width:8rem"></Column>
                        <Column field="qty_order" header="QTY" :sortable="false" style="min-width:8rem"></Column>
                        <Column field="diterima" header="PROGRESS" :sortable="false" style="min-width:8rem"></Column>
                        <Column field="sisa" header="DEVIASI" :sortable="false" style="min-width:8rem"></Column>
                        <Column field="status" header="Status">
                            <template #body="slotProps">
                                <span :class="['status-badge', getSeverity(slotProps.data.status)]">
                                    {{ slotProps.data.status }}
                                </span>
                            </template>
                        </Column>
                        <template #empty>
                            No records found
                        </template>
                    </DataTable>
                </div>
            </div>
        </div>
    </layout>
</template>
    
<script>
import Layout from "../../Partials/Layout";
import ErrorsAndMessages from "../../Partials/ErrorsAndMessages";
import { usePage } from "@inertiajs/inertia-vue3";
import { Inertia } from "@inertiajs/inertia";
import { computed, inject } from "vue";
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import ColumnGroup from 'primevue/columngroup';
import Toolbar from 'primevue/toolbar';
import { getDataPo } from '../../Api/dashboard.api';
import VueApexCharts from 'vue3-apexcharts';

export default {
    name: "monitoring",
    components: {
        ErrorsAndMessages,
        Layout,
        DataTable,
        Column,
        ColumnGroup,
        apexchart: VueApexCharts
    },
    data() {
        return {
            products: null,
            productDialog: false,
            deleteProductDialog: false,
            deleteProductsDialog: false,
            product: {},
            loading: false,
            data: [],
            showTable: true,
            dataMon: [],
            dataPerPage: 5,
            // totalData: 0,
            statusCounts: [],
            display: false,
            filters: {},
            modalTitle: null,
            submitted: false,
            lazyParams: {
                page: 1
            },
            statuses: ['COMPLETE', 'IN PROGRESS', 'OVERDUE'],
            selectedStatus: null,
            pieChart: [],
            pieChartOptions: {
                labels: [],
                legend: {
                    position: 'bottom',
                },
                toolbar: {
                    show: true, // Aktifkan toolbar
                    tools: {
                        download: true
                    }
                },
            },
            pieChartSeries: [],

            mixedChart: [],
            chartOptions: {
                labels: [],
                chart: {
                    id: 'mixed-chart',
                },
                yaxis: [],
            },
            chartSeries: [
                {
                    name: 'Target',
                    type: 'line',
                    data: [], // Ganti dengan data qty_order dari controller
                },
                {
                    name: 'Actual',
                    type: 'bar',
                    data: [], // Ganti dengan data diterima dari controller
                    yAxisIndex: 1,
                },
            ],
        }
    },
    methods: {
        async loadLazyData() {
            this.loading = true;
            const res = await getDataPo({ page: this.lazyParams.page, status: this.selectedStatus })
            console.log(res);
            this.data = res.data.data;
            // this.totalData = res.data.total;

            this.loading = false;
        },
        onPage(event) {
            this.lazyParams.page = event.page + 1;
            this.loadLazyData();
        },
        toggleTable() {
            this.showTable = !this.showTable;
        },
        getSeverity(status) {
            switch (status) {
                case 'COMPLETE':
                    return 'badge badge-success';

                case 'IN PROGRESS':
                    return 'badge badge-warning';

                case 'OVERDUE':
                    return 'badge badge-danger';

                default:
                    return null;
            }
        },
        filterStatus() {
            this.totalData = 0;
            this.loadLazyData();
        },
        async fetchChartData() {
            try {
                const responseStatus = await axios.get('/statusCounts');
                // console.log(response);
                this.pieChartOptions.labels = responseStatus.data.categories;
                this.pieChartSeries = responseStatus.data.series;

                const response = await axios.get('/qtyDiterima');
                // console.log(response);
                this.chartOptions.labels = response.data.categories;
                this.chartSeries[0].data = response.data.qty_order;
                this.chartSeries[1].data = response.data.diterima;

                // Update grafik
                this.$refs.pieChart.updateOptions({
                    labels: responseStatus.data.categories
                });

                this.$refs.mixedChart.updateOptions({
                    labels: response.data.categories
                });

            } catch (error) {
                console.error('Error fetching chart data:', error);
            }
        },
    },
    props: {
        errors: Object
    },

    mounted() {
        this.data = this.$page.props.data;
        this.dataMon = this.$page.props.dataMon.data;
        this.totalData = this.$page.props.dataMon.total;

        this.statusCounts = this.$page.props.statusCounts;

        this.fetchChartData();

        console.log(this.data);
        console.log(this.totalData);
    }
}
</script>
    
<style scoped>
.status-badge {
    min-width: 80px;
}
</style>
    