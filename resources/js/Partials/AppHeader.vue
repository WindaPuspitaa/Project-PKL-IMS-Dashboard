<template>
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <li class="nav-item" v-if="user">
        <span class="navbar-text mr-3" v-if="user">
          Logged in as {{ user.name }}
        </span>
        <inertia-link :href="$route('logout')" as="button" method="get" class="nav-link logout-link"
          style="display: inline;background: #343a40" type="button">Logout</inertia-link>
      </li>
      <!-- <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li> -->
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-light-danger elevation-4" style="position: fixed;">
    <!-- Brand Logo -->
    <div class="brand text-center">
      <span class="brand-text font-weight-light text" style="font-size: 30px; color: black;"><b
          style="color: #fe0000;">IMS</b>
        Dashboard</span>
    </div>

    <!-- Sidebar -->
    <div class="sidebar">

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a :href="$route('so.index')" class="nav-link" :class="$route().current('so.index') ? 'active' : ''">
              <i class="fas fa-home nav-icon"></i>
              <p>Home</p>
            </a>

          </li>

          <li class="nav-item">
            <a :href="$route('dashboard.dashboard')" class="nav-link"
              :class="$route().current('dashboard.dashboard') ? 'active' : ''">
              <i class="fas fa-tachometer-alt nav-icon"></i>
              <p>Dashboard</p>
            </a>

          </li>

          <li class="nav-item">
            <a :href="$route('report')" class="nav-link" :class="$route().current('report') ? 'active' : ''">
              <i class="fas fa-file nav-icon"></i>
              <p>Report</p>
            </a>

          </li>

          <!-- <li class="nav-item">
            <a :href="$route('manageUser')" class="nav-link" :class="$route().current('manageUser') ? 'active' : ''">
              <i class="fas fa-user nav-icon"></i>
              <p>Manage User</p>
            </a>

          </li> -->

          <li class="nav-item" :class="$route().current().indexOf('data-master') >= 0 ? 'menu-open' : ''">
            <a href="#" class="nav-link" :class="$route().current().indexOf('data-master') >= 0 ? 'active' : ''">
              <i class="nav-icon fas fa-database"></i>
              <p>
                Data Master
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a :href="$route('data-master.pageUser')" class="nav-link"
                  :class="$route().current('data-master.pageUser') ? 'active' : ''">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Manage User</p>
                </a>
              </li>
              <li class="nav-item">
                <a :href="$route('data-master.pageProyek')" class="nav-link"
                  :class="$route().current('data-master.pageProyek') ? 'active' : ''">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Master Proyek</p>
                </a>
              </li>
            </ul>
          </li>

          <!-- <li class="nav-item" :class="$route().current().indexOf('ppc') >= 0 ? 'menu-open' : ''">
            <a href="#" class="nav-link" :class="$route().current().indexOf('ppc') >= 0 ? 'active' : ''">
              <i class="nav-icon fas fa-inbox"></i>
              <p>
                Procurement
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a :href="$route('ppc.input_materialppc')" class="nav-link"
                  :class="$route().current('ppc.input_materialppc') ? 'active' : ''">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Input Material</p>
                </a>
              </li>
              <li class="nav-item">
                <a :href="$route('transaksi.lpbg')" class="nav-link"
                  :class="$route().current('transaksi.lpbg') ? 'active' : ''">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Realisasi Material</p>
                </a>
              </li>
              <li class="nav-item">
                <a :href="$route('transaksi.sttp')" class="nav-link"
                  :class="$route().current('transaksi.sttp') ? 'active' : ''">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Create STTPP</p>
                </a>
              </li>
            </ul>
          </li>

          <li class="nav-item" :class="$route().current().indexOf('transaksi') >= 0 ? 'menu-open' : ''">
            <a href="#" class="nav-link" :class="$route().current().indexOf('transaksi') >= 0 ? 'active' : ''">
              <i class="nav-icon fas fa-exchange-alt"></i>
              <p>
                Transaksi
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a :href="$route('transaksi.input_material')" class="nav-link"
                  :class="$route().current('transaksi.input_material') ? 'active' : ''">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Input Material</p>
                </a>
              </li>
              <li class="nav-item">
                <a :href="$route('transaksi.lpbg')" class="nav-link"
                  :class="$route().current('transaksi.lpbg') ? 'active' : ''">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Input LPBG / SJN</p>
                </a>
              </li>
              <li class="nav-item">
                <a :href="$route('transaksi.sttp')" class="nav-link"
                  :class="$route().current('transaksi.sttp') ? 'active' : ''">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Create STTPP</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item" :class="$route().current().indexOf('cek') >= 0 ? 'menu-open' : ''">
            <a href="#" class="nav-link" :class="$route().current().indexOf('cek') >= 0 ? 'active' : ''">
              <i class="fas fa-check"></i>
              <p>
                Pengecekan
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a :href="$route('cek.ceklpbg')" class="nav-link"
                  :class="$route().current('cek.ceklpbg') ? 'active' : ''">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Cek Stok Barang</p>
                </a>
              </li>
              <li class="nav-item">
                <a :href="$route('cek.ceksttp')" class="nav-link"
                  :class="$route().current('cek.ceksttp') ? 'active' : ''">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Cek STTPP</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item" :class="$route().current().indexOf('master') >= 0 ? 'menu-open' : ''">
            <a href="#" class="nav-link" :class="$route().current().indexOf('master') >= 0 ? 'active' : ''">
              <i class="nav-icon fas fa-database"></i>
              <p>
                Data Master
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a :href="$route('master.PageProyek')" class="nav-link"
                  :class="$route().current('master.PageProyek') ? 'active' : ''">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Proyek</p>
                </a>
              </li>
              <li class="nav-item">
                <a :href="$route('master.PageMaster')" class="nav-link"
                  :class="$route().current('master.PageMaster') ? 'active' : ''">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Lokasi</p>
                </a>
              </li>
              <li class="nav-item">
                <a :href="$route('master.PageGedung')" class="nav-link"
                  :class="$route().current('master.PageGedung') ? 'active' : ''">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Gedung</p>
                </a>
              </li>
              <li class="nav-item" style="display: none!important">
                <a :href="$route('master.PageUser')" class="nav-link"
                  :class="$route().current('master.PageUser') ? 'active' : ''">
                  <i class="far fa-user nav-icon"></i>
                  <p>User</p>
                </a>
              </li>
            </ul>
          </li> -->

        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
</template>

<script>
import { computed } from "vue";
import { usePage } from "@inertiajs/inertia-vue3";

export default {
  name: "AppHeader",
  setup() {
    const user = computed(() => usePage().props.value.auth.user);

    return {
      user
    }
  },
  created() {

  }
}
</script>
