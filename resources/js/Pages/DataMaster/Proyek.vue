<template>
    <layout title="Proyek">
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
                        <label for="firstname">Kode Proyek</label>
                        <InputText v-model="form.id" type="text" hidden />
                        <InputText v-model="form.kode_proyek" type="text" />
                    </div>
                    <div class="p-field">
                        <label for="firstname">Nama Proyek</label>
                        <InputText v-model="form.id" type="text" hidden />
                        <InputText v-model="form.nama_proyek" type="text" />
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

                <DataTable :value="dataProyek.data" :lazy="true" :paginator="true" :rows="dataProyek.per_page"
                    v-model:filters="filters" ref="dt" :totalRecords="dataProyek.total" :loading="loading"
                    @page="onPage($event)"
                    paginatorTemplate="FirstPageLink PrevPageLink PageLinks NextPageLink LastPageLink CurrentPageReport"
                    currentPageReportTemplate="Showing {first} to {last} of {totalRecords}" responsiveLayout="scroll">
                    <Column field="no" header="No" :sortable="false" style="min-width:2rem">
                        <template #body="slotProps">
                            {{ slotProps.index + 1 }}
                        </template>
                    </Column>

                    <!-- <Column field="no" header="No" :sortable="false" style="min-width:2rem">
                        <template #body="slotProps">
                            {{ ((lazyParams.page - 1)) + slotProps.index + 1 }}
                        </template>
                    </Column> -->
                    <Column field="kode_proyek" header="Kode Proyek" :sortable="false" style="min-width:16rem"></Column>
                    <Column field="nama_proyek" header="Nama Proyek" :sortable="false" style="min-width:16rem"></Column>
                    <Column header="Action" :exportable="false">
                        <template #body="slotProps">
                            <Button icon="pi pi-pencil" class="p-button-rounded p-button-success p-mr-2"
                                @click="editProyek(slotProps.data)" style="margin-right: 10px;" />
                            <Button @click="onDelete(slotProps.data)" icon="pi pi-trash"
                                class="p-button-rounded p-button-danger" />
                        </template>
                    </Column>
                    <template #empty>
                        No records found
                    </template>
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
import { simpanProyek, getProyek, hapusProyek } from '../../Api/dataMaster.api';
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
            dataProyek: [],
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
                kode_proyek: null,
                nama_proyek: null
            },
            initform: {
                id: null,
                kode_proyek: null,
                nama_proyek: null
            },
            lazyParams: {
                page: 1
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
            const res = await getProyek({ page: this.lazyParams.page, search: this.search })

            this.dataProyek = res.data.data;
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
                    await hapusProyek({ id: data.id });
                    await this.$toast.add({ severity: 'success', summary: 'Informasi!', detail: 'Berhasil Di hapus', life: 3000 });
                    await this.loadLazyData();
                },
                reject: () => {
                    //callback to execute when user rejects the action
                }
            });
        },
        editProyek(data) {
            this.modalTitle = 'Ubah';
            Object.assign(this.form, data);
            this.display = true;
        },
        async simpan() {
            await simpanProyek(this.form);
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
        this.dataProyek = this.$page.props.proyek;
        this.totalData = this.$page.props.total;

        console.log(this.dataProyek)
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
    