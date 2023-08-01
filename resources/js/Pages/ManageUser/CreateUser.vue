<template>
    <layout>
        <div>
            <div class="container-fuid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">Add User</h5>
                                <div class="card-tools">

                                </div>
                            </div>
                            <div class="card-body">
                                <form @submit.prevent="formData.post('/manage-user')">
                                    <div class="mb-3">
                                        <label class="form-label">Nama</label>
                                        <input type="text" v-model="formData.name" class="form-control">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Email</label>
                                        <input type="email" v-model="formData.email" class="form-control">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Status</label>
                                        <input type="text" v-model="formData.nip" class="form-control">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Password</label>
                                        <input type="password" v-model="formData.password" class="form-control">
                                    </div>
                                    <button @click="simpan" type="submit" value="Save"
                                        class="btn btn-primary">Submit</button>
                                </form>
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
import { useForm, usePage } from "@inertiajs/inertia-vue3";
import { Inertia } from "@inertiajs/inertia";
import { computed, inject } from "vue";
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import ColumnGroup from 'primevue/columngroup';
import { simpanUser } from '../../Api/users.api';

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
    props: {
        users: Array,
        errors: Object
    },
    data() {
        return {
            formData: {
                id: null,
                name: "",
                email: "",
                nip: "",
                password: "",
            },
        };
    },
    methods: {
        async simpan() {
            await simpanUser(this.formData);
            await this.$toast.add({ severity: 'success', summary: 'Informasi!', detail: 'Berhasil Di simpan', life: 3000 });
            await this.loadLazyData();
            this.display = false;
        }
    }
}
</script>