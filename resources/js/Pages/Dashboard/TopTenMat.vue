<template>
    <layout title="Dashboard Top 10 Material">
        <div>
            <div class="form-group">
                <label for="wbs_element" class="control-label" style="display: block; margin-top: 1rem;">Project:</label>
                <!-- <select name="wbs_element" id="wbs_element" class="custom-select custom-select-sm" v-model="selectedWbs"
                    @change="fetchChartData">
                    <option value="M1-22041.4300003938">PENGADAAN 612 KERETA REPLACEMENT PT KAI</option>
                    <option value="M1-22041.8000122041">AFTERSALES PGDN 612 REPLACEMENT PT KAI</option>
                    <option value="C789">Nama Proyek 3</option>
                </select> -->
                <div class="card flex justify-content-center">
                    <Dropdown v-model="selectedWbs" :options="wbs_options" @Change="fetchChartData" optionLabel="label"
                        optionValue="value" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="card card-primary">
                        <div class="card-body">
                            <p class="text-center">Top 10 Expensive Raw Material</p>
                            <apexchart ref="chartRawMaterial" type="bar" :options="chartOptionsRawMaterial"
                                :series="chartSeriesRawMaterial" />
                        </div>
                    </div>
                    <div class="card card-primary">
                        <div class="card-body">
                            <p class="text-center">Top 10 Expensive Tools</p>
                            <apexchart ref="chartTools" type="bar" :options="chartOptionsTools"
                                :series="chartSeriesTools" />
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card card-primary">
                        <div class="card-body">
                            <p class="text-center">Top 10 Expensive Component & Fastening</p>
                            <apexchart ref="chartComponent" type="bar" :options="chartOptionsComponent"
                                :series="chartSeriesComponent" />
                        </div>
                    </div>
                    <div class="card card-primary">
                        <div class="card-body">
                            <p class="text-center">Top 10 Expensive Consumable</p>
                            <apexchart ref="chartConsumable" type="bar" :options="chartOptionsConsumable"
                                :series="chartSeriesConsumable" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </layout>
</template>
  
<script>
import Layout from "../../Partials/Layout";
import axios from "axios";

export default {
    components: {
        Layout,
    },
    props: {
        wbs_elements: Array,
    },
    data() {
        return {
            selectedWbs: 'M1-22041.4300003938',
            chartOptionsRawMaterial: {
                yaxis: {
                    labels: {
                        formatter: function (value) {
                            return value.toLocaleString("id-ID", { style: "currency", currency: "IDR" });
                        }
                    },
                },
                xaxis: {
                    categories: [],
                },
                dataLabels: {
                    enabled: false
                },
            },
            chartSeriesRawMaterial: [{
                name: 'Data Series',
                data: [],
            }],
            chartOptionsTools: {
                yaxis: {
                    labels: {
                        formatter: function (value) {
                            return value.toLocaleString("id-ID", { style: "currency", currency: "IDR" });
                        }
                    },
                },
                xaxis: {
                    categories: [],
                },
                dataLabels: {
                    enabled: false
                },
            },
            chartSeriesTools: [{
                name: 'Data Series',
                data: [],
            }],
            chartOptionsComponent: {
                yaxis: {
                    labels: {
                        formatter: function (value) {
                            return value.toLocaleString("id-ID", { style: "currency", currency: "IDR" });
                        }
                    },
                },
                xaxis: {
                    categories: [],
                },
                dataLabels: {
                    enabled: false
                },
            },
            chartSeriesComponent: [{
                name: 'Data Series',
                data: [],
            }],
            chartOptionsConsumable: {
                yaxis: {
                    labels: {
                        formatter: function (value) {
                            return value.toLocaleString("id-ID", { style: "currency", currency: "IDR" });
                        }
                    },
                },
                xaxis: {
                    categories: [],
                },
                dataLabels: {
                    enabled: false
                },
            },
            chartSeriesConsumable: [{
                name: 'Data Series',
                data: [],
            }],
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
                // Mengambil data untuk Raw Material
                const responseRawMaterial = await axios.get(`/topRawMat/${this.selectedWbs}`);
                this.chartSeriesRawMaterial[0].data = responseRawMaterial.data.series;
                this.chartOptionsRawMaterial.xaxis.categories = responseRawMaterial.data.categories;

                // Mengambil data untuk Tools
                const responseTools = await axios.get(`/topTools/${this.selectedWbs}`);
                this.chartSeriesTools[0].data = responseTools.data.series;
                this.chartOptionsTools.xaxis.categories = responseTools.data.categories;

                // Mengambil data untuk Component & Fastening
                const responseComponent = await axios.get(`/topComFas/${this.selectedWbs}`);
                this.chartSeriesComponent[0].data = responseComponent.data.series;
                this.chartOptionsComponent.xaxis.categories = responseComponent.data.categories;

                // Mengambil data untuk Consumable
                const responseConsumable = await axios.get(`/topConsum/${this.selectedWbs}`);
                this.chartSeriesConsumable[0].data = responseConsumable.data.series;
                this.chartOptionsConsumable.xaxis.categories = responseConsumable.data.categories;

                // Update grafik
                this.$refs.chartRawMaterial.updateOptions({
                    xaxis: {
                        categories: responseRawMaterial.data.categories
                    }
                });

                this.$refs.chartTools.updateOptions({
                    xaxis: {
                        categories: responseTools.data.categories
                    }
                });

                this.$refs.chartComponent.updateOptions({
                    xaxis: {
                        categories: responseComponent.data.categories
                    }
                });

                this.$refs.chartConsumable.updateOptions({
                    xaxis: {
                        categories: responseConsumable.data.categories
                    }
                });

            } catch (error) {
                console.error('Error fetching chart data:', error);
            }
        },
    },
};
</script>
  