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
                        <label for="firstname">Status</label>
                        <InputText v-model="form.id" type="text" hidden />
                        <InputText v-model="form.nip" type="text" />
                    </div>
                    <div class="p-field" v-if="modalTitle !== 'Ubah'">
                        <label for="firstname">Password</label>
                        <InputText v-model="form.id" type="text" hidden />
                        <InputText v-model="form.password" type="password" />
                    </div>
                </div>
                <template #footer>
                    <Button label="Batal" icon="pi pi-times" class="p-button-text" @click="display = false" />
                    <Button label="Simpan" icon="pi pi-check" autofocus @click="simpan" />
                </template>
            </Dialog>
            <!-- end modal -->

            <div class="card">
                <!-- <Toolbar class="p-mb-4">
                    <template #left>
                        <Button label="Tambah" icon="pi pi-plus" class="p-button-success p-mr-2" @click="tambah" />
                    </template>

                    <template #right>
                        <span class="p-input-icon-left">
                            <i class="pi pi-search" />
                            <InputText placeholder="Search..." />
                        </span>
                    </template>
                </Toolbar> -->
                <div class="card-header">
                    <div class="card-tools">
                        <Button label="Tambah" icon="pi pi-plus" class="p-button-success p-mr-2" @click="tambah" />
                    </div>
                </div>

                <DataTable :value="dataUser.data" :lazy="true" :paginator="true" :rows="5" v-model:filters="filters"
                    ref="dt" :totalRecords="dataUser.total" :loading="loading" @page="onPage($event)"
                    paginatorTemplate="FirstPageLink PrevPageLink PageLinks NextPageLink LastPageLink CurrentPageReport"
                    currentPageReportTemplate="Showing {first} to {last} of {totalRecords}" responsiveLayout="scroll">
                    <template #empty>
                        No records found
                    </template>

                    <Column field="no" header="No" :sortable="false" style="min-width:2rem">
                        <template #body="slotProps">
                            {{ ((lazyParams.page * 5) + slotProps.index) + 1 }}
                        </template>
                    </Column>
                    <Column field="name" header="Nama" :sortable="false" style="min-width:16rem"></Column>
                    <Column field="email" header="Email" :sortable="false" style="min-width:16rem"></Column>
                    <Column field="nip" header="Status" :sortable="false" style="min-width:16rem"></Column>
                    <Column header="Action" :exportable="false">
                        <template #body="slotProps">
                            <Button icon="pi pi-pencil" class="p-button-rounded p-button-success p-mr-2"
                                @click="editUser(slotProps.data)" style="margin-right: 10px;" />
                            <Button @click="onDelete(slotProps.data)" icon="pi pi-trash"
                                class="p-button-rounded p-button-warning" />
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
import { simpanUser, getUser, hapusUser } from '../../Api/users.api';
export default {
    name: "master_lokasi",
    components: {
        ErrorsAndMessages,
        Layout,
        DataTable,
        Column,
        ColumnGroup,
    },
    data() {
        return {
            products: null,
            productDialog: false,
            deleteProductDialog: false,
            deleteProductsDialog: false,
            product: {},
            loading: false,
            dataUser: [],
            display: false,
            selectedProducts: null,
            filters: {},
            modalTitle: null,
            submitted: false,
            form: {
                id: null,
                name: null,
                email: null,
                nip: null
            },
            initform: {
                id: null,
                name: null,
                email: null,
                nip: null
            },
            lazyParams: {
                page: 0
            },
            statuses: [
                { label: 'INSTOCK', value: 'instock' },
                { label: 'LOWSTOCK', value: 'lowstock' },
                { label: 'OUTOFSTOCK', value: 'outofstock' }
            ]
        }
    },
    methods: {
        async loadLazyData() {
            this.loading = true;
            const res = await getUser({ page: this.lazyParams.page + 1 })

            this.dataUser = res.data.data;

            this.loading = false;
        },
        onPage(event) {
            this.lazyParams = event;
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

        console.log(this.dataUser)
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
    