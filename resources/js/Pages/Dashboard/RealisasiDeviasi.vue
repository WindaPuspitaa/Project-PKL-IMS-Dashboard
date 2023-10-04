<template>
    <layout title="Dashboard Realisai & Deviasi">
        <div>
            <div class="row">
                <div class="col-md-6">
                    <div class="card card-primary">
                        <div class="card-body">
                            <p class="text-center">Raw Material</p>
                            <sccRawMat />
                        </div>
                    </div>

                    <div class="card card-primary">
                        <div class="card-body">
                            <p class="text-center">Tools</p>
                            <sccTools />
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card card-primary">
                        <div class="card-body">
                            <p class="text-center">Component & Fastening</p>
                            <Chart />
                        </div>
                    </div>

                    <div class="card card-primary">
                        <div class="card-body">
                            <p class="text-center">Consumable</p>
                            <sccConsumable />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </layout>
</template>
    
<script>
import Layout from "../../Partials/Layout";
import sccRawMat from '../../Components/sccRawMat.vue';
import sccConsumable from '../../Components/sccConsumable.vue';
import sccTools from '../../Components/sccTools.vue';
import Chart from '../Chart/BarChart.vue';

export default {
    components: {
        Layout,
        sccRawMat,
        sccTools,
        sccConsumable,
        Chart,
    },
}
</script>