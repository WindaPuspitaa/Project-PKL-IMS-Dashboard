<template>
    <layout>
        <div>
            <div class="container-fuid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">Users</h5>
                                <div class="card-tools">
                                    <ul class="nav nav-pills ml-auto">
                                        <li class="nav-item"><a href="/manage-user/create-user"
                                                class="btn btn-primary btn-sm">Add User</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Nama</th>
                                            <th>Email</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="user in users" :key="user.id">
                                            <td>{{ user.id }}</td>
                                            <td>{{ user.name }}</td>
                                            <td>{{ user.email }}</td>
                                            <td>{{ user.nip }}</td>
                                            <td>
                                                <inertia-link :href="`manage-user/${user.id}/edit`" class="btn btn-warning"
                                                    style="margin-right: 10px;">Edit</inertia-link>
                                                <a href="" class="btn btn-danger">Delete</a>
                                            </td>
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
import { Link } from "@inertiajs/inertia-vue3";

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
            },
        };
    },
}
</script>