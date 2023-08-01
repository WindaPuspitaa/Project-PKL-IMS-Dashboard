<template>
  <div class="hold-transition login-page" style="background-color: #fe0000; background-size: cover;">
    <div class="overlay"
      style="width: 100%; height: 100%; position: absolute; background-color: rgba(255, 255, 255, 0.4); z-index: 0;">
    </div>

    <div class="form-box col-md-8 col-sm-10 col-xs-12" style="background-color: #ffffff; border-radius: 15px;">
      <div class="row">
        <div class="col-lg-7 col-md-6 col-sm-6 col-xs-12" style="background: url('images/bg.jpg'); background-size: cover;
  background-repeat: no-repeat;
  background-position: center center;
  min-height: 100%;
  border-radius: 15px;">
          <!-- You can add custom CSS styles for the background image here -->
        </div>
        <div class="col-lg-5 col-md-6 col-sm-6 col-xs-12">
          <!-- /.login-logo -->
          <div class="card">
            <div class="card-header text-center">
              <h1><b style="color: #fe0000;">IMS</b> Dashboard </h1>
            </div>
            <div class="card-body">
              <form method="post" @submit.prevent="submit">
                <errors-and-messages :errors="errors"></errors-and-messages>
                <div class="form-group">
                  <label for="username">Username</label>
                  <div class="input-group mb-3">
                    <input type="text" class="form-control" name="nip" v-model="form.name" placeholder="Username" />
                    <div class="input-group-append">
                      <div class="input-group-text">
                        <span class="fas fa-envelope"></span>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="password">Password</label>
                  <div class="input-group mb-3">
                    <input type="password" class="form-control" name="password" id="password" v-model="form.password"
                      placeholder="Password" />
                    <div class="input-group-append">
                      <div class="input-group-text">
                        <span class="fas fa-lock"></span>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <!-- /.col -->
                  <div class="col-12">
                    <input type="submit" class="btn btn-danger btn-block" value="Login" />
                  </div>
                  <!-- /.col -->
                </div>
              </form>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
      </div>
    </div>

    <div style="position: fixed; bottom: 20px; z-index: 10; font-weight: bold;">
      Made By Divisi Teknologi Informasi
    </div>
  </div>
</template>

<script>
import AppHeader from "../../Partials/AppHeader";
import ErrorsAndMessages from "../../Partials/ErrorsAndMessages";

import { Inertia } from "@inertiajs/inertia";
import { usePage } from '@inertiajs/inertia-vue3'
import { reactive, inject } from 'vue';

export default {
  components: {
    ErrorsAndMessages,
    AppHeader
  },
  name: "Login",
  props: {
    errors: Object
  },
  setup() {
    const form = reactive({
      name: null,
      password: null,
      _token: usePage().props.value.csrf_token
    });

    const route = inject('$route');

    function submit() {
      Inertia.post(route('login'), form);
    }

    return {
      form, submit
    }
  }
}
</script>

<style scoped>
form {
  margin-top: 20px;
}

/* Add custom styles for the background image */
/* .bg-image {
  background-image: url('images/bg.jpg');
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center center;
  min-height: 100%;
  border-radius: 15px;
} */
</style>
