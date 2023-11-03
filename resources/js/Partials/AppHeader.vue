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

    <!-- <div class="brand-link text-center">
      <img src="../../../public/images/logoims.jpg" alt="Logo" height="30" class="me-2">
      <span class="brand-text font-weight-bold text-danger" style="font-size: 22px;"><b
          style="color: #000;">Dashboard</b></span>
    </div> -->
    <div class="brand-link text-center">
      <span class="brand-text font-weight-bold text-danger" style="font-size: 20px;"><b style="color: #000;">Monitoring PO
          Logistik</b></span>
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

          <!-- <li class="nav-item">
            <a :href="$route('dashboard.dashboard')" class="nav-link"
              :class="$route().current('dashboard.dashboard') ? 'active' : ''">
              <i class="fas fa-tachometer-alt nav-icon"></i>
              <p>Dashboard</p>
            </a>

          </li> -->

          <li class="nav-item" :class="$route().current().indexOf('dashboard') >= 0 ? 'menu-open' : ''">
            <a href="#" class="nav-link" :class="$route().current().indexOf('dashboard') >= 0 ? 'active' : ''">
              <i class="fas fa-tachometer-alt nav-icon"></i>
              <p>
                Dashboard
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a :href="$route('dashboard.pageTotalBiaya')" class="nav-link"
                  :class="$route().current('dashboard.pageTotalBiaya') ? 'active' : ''">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Total Biaya</p>
                </a>
              </li>
              <li class="nav-item">
                <a :href="$route('dashboard.pageTopTenMat')" class="nav-link"
                  :class="$route().current('dashboard.pageTopTenMat') ? 'active' : ''">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Top 10 Material</p>
                </a>
              </li>
              <!-- <li class="nav-item">
                <a :href="$route('dashboard.pageRealDev')" class="nav-link"
                  :class="$route().current('dashboard.pageRealDev') ? 'active' : ''">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Realisasi & Deviasi</p>
                </a>
              </li>
              <li class="nav-item">
                <a :href="$route('dashboard.pageStok')" class="nav-link"
                  :class="$route().current('dashboard.pageStok') ? 'active' : ''">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Stok</p>
                </a>
              </li> -->
              <li class="nav-item">
                <a :href="$route('dashboard.pageMonitoring')" class="nav-link"
                  :class="$route().current('dashboard.pageMonitoring') ? 'active' : ''">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Monitoring</p>
                </a>
              </li>
              <!-- <li class="nav-item">
                <a :href="$route('dashboard.dashboard')" class="nav-link"
                  :class="$route().current('dashboard.dashboard') ? 'active' : ''">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard</p>
                </a>
              </li> -->
            </ul>
          </li>

          <!-- <li class="nav-item">
            <a :href="$route('report')" class="nav-link" :class="$route().current('report') ? 'active' : ''">
              <i class="fas fa-file nav-icon"></i>
              <p>Report</p>
            </a>

          </li> -->

          <li class="nav-item">
            <a :href="$route('pageReport')" class="nav-link" :class="$route().current('pageReport') ? 'active' : ''">
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

          <li v-if="user && user.role_id === '1'" class="nav-item"
            :class="$route().current().indexOf('data-master') >= 0 ? 'menu-open' : ''">
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

    console.log(user);

    return {
      user
    }
  },
  created() {

  }
}
</script>
