<template>
    <layout title="Users">
        <div>
            <ConfirmDialog></ConfirmDialog>
            <Toast position="top-center" />
            <!-- modal -->
            <Dialog header="Header" v-model:visible="display">
                <template #header>
                    <label>{{ modalTitle }}</label>
                </template>

                <div class="p-fluid">
                    <div class="p-field">
                        <label for="firstname">Nama</label>
                        <InputText v-model="form.id" type="text" hidden />
                        <InputText v-model="form.name" type="text" />
                    </div>
                    <div class="p-field">
                        <label for="firstname">Email</label>
                        <InputText v-model="form.id" type="text" hidden />
                        <InputText v-model="form.email" type="email" />
                    </div>
                    <div class="p-field">
                        <label for="firstname">NIP</label>
                        <InputText v-model="form.id" type="text" hidden />
                        <InputText v-model="form.nip" type="text" />
                    </div>
                    <div class="p-field" v-if="modalTitle !== 'Ubah'">
                        <label for="firstname">Password</label>
                        <InputText v-model="form.id" type="text" hidden />
                        <InputText v-model="form.password" type="password" />
                    </div>
                    <div class="p-field">
                        <label for="firstname">Role</label>
                        <InputText v-model="form.id" type="text" hidden />
                        <select name="role" id="id" class="custom-select custom-select-sm" placeholder="Pilih Role"
                            v-model="form.role_id">
                            <option v-for="role in roles" :key="role.id" :value="role.id">{{ role.name }}</option>
                        </select>
                    </div>
                </div>
                <template #footer>
                    <Button label="Batal" icon="pi pi-times" class="p-button-text" @click="display = false" />
                    <Button label="Simpan" icon="pi pi-check" autofocus @click="simpan" />
                </template>
            </Dialog>
            <!-- end modal -->

            <div class="card">
                <Toolbar>
                    <template #start>
                        <Button label="Tambah" icon="pi pi-plus" class="p-button-primary p-mr-2" @click="tambah" />
                    </template>

                    <template #end>
                        <!-- <span class="p-input-icon-left">
                            <i class="pi pi-search" />
                            <InputText placeholder="Search..." />
                        </span> -->
                        <InputText placeholder="Search..." v-model="search" style="font-size: 13px;" />
                        <Button icon="pi pi-search" iconPos="right" class="p-button-sm" @click="onSearch" />
                    </template>
                </Toolbar>

                <DataTable :value="dataUser.data" :lazy="true" :paginator="true" :rows="dataUser.per_page"
                    v-model:filters="filters" ref="dt" :totalRecords="dataUser.total" :loading="loading"
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
                    <Column field="name" header="Nama" :sortable="false" style="min-width:10rem"></Column>
                    <Column field="email" header="Email" :sortable="false" style="min-width:10rem"></Column>
                    <Column field="nip" header="NIP" :sortable="false" style="min-width:10rem"></Column>
                    <Column field="role_name" header="Role" :sortable="false" style="min-width:10rem"></Column>
                    <Column header="Action" :exportable="false">
                        <template #body="slotProps">
                            <Button icon="pi pi-pencil" class="p-button-rounded p-button-success p-mr-2"
                                @click="editUser(slotProps.data)" style="margin-right: 10px;" />
                            <Button @click="onDelete(slotProps.data)" icon="pi pi-trash"
                                class="p-button-rounded p-button-danger" />
                        </template>
                    </Column>
                </DataTable>
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
import { simpanUser, getUser, hapusUser } from '../../Api/dataMaster.api';
export default {
    name: "master_user",
    components: {
        ErrorsAndMessages,
        Layout,
        DataTable,
        Column,
        ColumnGroup,
    },
    props: {

    },
    data() {
        return {
            roles: [],
            products: null,
            productDialog: false,
            deleteProductDialog: false,
            deleteProductsDialog: false,
            product: {},
            loading: false,
            dataUser: [],
            // dataPerPage: 5,
            totalData: 0,
            search: '',
            display: false,
            selectedProducts: null,
            filters: {},
            modalTitle: null,
            submitted: false,
            form: {
                id: null,
                name: null,
                email: null,
                nip: null,
                role_id: null,
                role_name: null
            },
            initform: {
                id: null,
                name: null,
                email: null,
                nip: null,
                role_id: null,
                role_name: null
            },
            lazyParams: {
                page: 1
            }
        }
    },
    methods: {
        async loadLazyData() {
            this.loading = true;
            const res = await getUser({ page: this.lazyParams.page, search: this.search })
            // console.log(res);
            this.dataUser = res.data.data;
            this.totalData = res.data.total;

            this.loading = false;
        },
        onSearch() {
            this.totalData = 0;
            this.loadLazyData();
        },
        onPage(event) {
            this.lazyParams.page = event.page + 1;
            this.loadLazyData();
        },
        tambah() {
            this.modalTitle = 'Tambah';
            this.display = true;
            Object.assign(this.form, this.initform);

        },
        onDelete(data) {
            this.$confirm.require({
                message: 'Are you sure you want to proceed?',
                header: 'Confirmation',
                icon: 'pi pi-exclamation-triangle',
                accept: async () => {
                    await hapusUser({ id: data.id });
                    await this.$toast.add({ severity: 'success', summary: 'Informasi!', detail: 'Berhasil Di hapus', life: 3000 });
                    await this.loadLazyData();
                },
                reject: () => {
                    //callback to execute when user rejects the action
                }
            });
        },
        editUser(data) {
            this.modalTitle = 'Ubah';
            Object.assign(this.form, data);
            this.display = true;
        },
        async simpan() {
            await simpanUser(this.form);
            await this.$toast.add({ severity: 'success', summary: 'Informasi!', detail: 'Berhasil Di simpan', life: 3000 });
            await this.loadLazyData();
            this.display = false;

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
        this.dataUser = this.$page.props.users;
        this.totalData = this.$page.props.total;

        this.roles = this.$page.props.roles;

        console.log(this.dataUser);
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
    