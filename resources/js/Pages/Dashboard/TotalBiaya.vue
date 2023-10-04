<template>
    <layout title="Dashboard Total Biaya">
        <div>
            <div class="form-group">
                <label for="wbs_element" class="control-label" style="display: block; margin-top: 1rem;">Project:</label>
                <!-- <select name="wbs_element" id="wbs_element" class="custom-select custom-select-sm"
                    placeholder="Pilih WBS Element" v-model="selectedWbs" @change="fetchChartData"> -->
                <!-- <option v-for="wbs in wbs_elements" :key="wbs.id_wbs" :value="wbs.id_wbs">{{ wbs.name }}</option> -->
                <!-- <option value="M1-22041.4300003938">PENGADAAN 612 KERETA REPLACEMENT PT KAI</option>
                    <option value="M1-22041.8000122041">AFTERSALES PGDN 612 REPLACEMENT PT KAI</option>
                    <option value="C789">Nama Proyek 3</option>
                </select> -->
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
        </div>
    </layout>
</template>
    
<script>
import Layout from "../../Partials/Layout";
import VueApexCharts from 'vue3-apexcharts';
import axios from "axios";
import PieTotalBiaya from '../../Components/PieTotalBiaya.vue';

export default {
    components: {
        Layout,
        apexchart: VueApexCharts,
        PieTotalBiaya,
    },
    props: {
        tabelPo: Array,
        wbs_elements: Array,
    },
    data() {
        return {
            // selectedWbs: '1',
            selectedWbs: 'M1-22041.4300003938',
            selectedCity: null,
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
    mounted() {
        this.fetchChartData();
    },
    methods: {
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
};
</script>