<?php

use App\Http\Controllers\Auth\{
    LoginController,
    RegisterController,
};

use App\Http\Controllers\{
    MasterController,
    PostsController,
    DcrController,
    SoContractController,
    TransaksiController,
    CetakController,
    CekController,
    DashboardController,
    ReportController,
    PpcController,
    UserController,
    DataMasterController
};

use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('login', [LoginController::class, 'showLoginForm'])->name('showLoginForm')->middleware('guest');
Route::get('register', [RegisterController::class, 'showRegisterForm'])->name('showRegisterForm')->middleware('guest');

Route::post('login', [LoginController::class, 'authenticate'])->name('login');
Route::post('register', [RegisterController::class, 'register'])->name('register');

Route::get('logout', [LoginController::class, 'logout'])->name('logout');

Route::prefix('dcr')->name('dcr.')->group(function () {
    Route::get('/', [DcrController::class, 'index'])->name('index');
});

Route::prefix('so')->name('so.')->group(function () {
    Route::get('/', [SoContractController::class, 'index'])->name('index');
    Route::post('/', [SoContractController::class, 'indexPost'])->name('indexPost');
    Route::get('/getDataSo', [SoContractController::class, 'getDataSo'])->name('data');
});

Route::prefix('dashboard')->name('dashboard.')->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
});


Route::get('/report', [ReportController::class, 'index'])->name('report');

Route::get('/manage-user', [UserController::class, 'index'])->name('manageUser');
Route::prefix('manage-user')->name('manage-user.')->group(function () {
    // Route::get('/', [UserController::class, 'index'])->name('manageUser');
    Route::get('/get-user', [UserController::class, 'index'])->name('getUser');
    Route::post('/simpan-user', [UserController::class, 'simpanUser'])->name('simpanUser');
    Route::post('/delete-user', [UserController::class, 'hapusUser'])->name('hapusUser');
});

// Data Master
Route::prefix('data-master')->name('data-master.')->group(function () {
    Route::get('/manage-user', [DataMasterController::class, 'pageUser'])->name('pageUser');
    Route::get('/get-user', [DataMasterController::class, 'pageUser'])->name('getUser');
    Route::post('/simpan-user', [DataMasterController::class, 'simpanUser'])->name('simpanUser');
    Route::post('/delete-user', [DataMasterController::class, 'hapusUser'])->name('hapusUser');

    Route::get('/master-proyek', [DataMasterController::class, 'pageProyek'])->name('pageProyek');
    Route::get('/get-proyek', [DataMasterController::class, 'pageProyek'])->name('getProyek');
    Route::post('/simpan-proyek', [DataMasterController::class, 'simpanProyek'])->name('simpanProyek');
    Route::post('/delete-proyek', [DataMasterController::class, 'hapusProyek'])->name('hapusProyek');
});

Route::prefix('master')->name('master.')->group(function () {
    Route::get('/lokasi', [MasterController::class, 'PageMaster'])->name('PageMaster');
    Route::get('/get-lokasi', [MasterController::class, 'getLokasi'])->name('getLokasi');
    Route::post('/simpan-lokasi', [MasterController::class, 'simpanLokasi'])->name('simpanLokasi');
    Route::post('/delete-lokasi', [MasterController::class, 'hapusLokasi'])->name('hapusLokasi');

    Route::get('/gedung', [MasterController::class, 'PageGedung'])->name('PageGedung');
    Route::get('/get-gedung', [MasterController::class, 'getGedung'])->name('getGedung');
    Route::post('/simpan-gedung', [MasterController::class, 'simpanGedung'])->name('simpanGedung');
    Route::post('/delete-gedung', [MasterController::class, 'hapusGedung'])->name('hapusGedung');

    Route::get('/proyek', [MasterController::class, 'PageProyek'])->name('PageProyek');
    Route::get('/get-proyek', [MasterController::class, 'PageProyek'])->name('getProyek');
    Route::post('/simpan-proyek', [MasterController::class, 'simpanProyek'])->name('simpanProyek');
    Route::post('/delete-proyek', [MasterController::class, 'hapusProyek'])->name('hapusProyek');

    Route::get('/user', [MasterController::class, 'PageUser'])->name('PageUser');
    Route::post('/simpan-user', [MasterController::class, 'simpanUser'])->name('simpanUser');
    Route::post('/delete-user', [MasterController::class, 'hapusUser'])->name('hapusUser');
});

Route::prefix('ppc')->name('ppc.')->group(function () {
    Route::get('/input_materialppc', [PpcController::class, 'InputMaterial'])->name('input_materialppc');
});

Route::prefix('transaksi')->name('transaksi.')->group(function () {
    Route::get('/bpm', [TransaksiController::class, 'PageBpm'])->name('bpm');
    Route::get('/sttp', [TransaksiController::class, 'PageSttp'])->name('sttp');
    Route::post('/sttp/simpan', [TransaksiController::class, 'SimpanSttp'])->name('simpan_sttp');
    Route::post('/sttp/delete', [TransaksiController::class, 'DeleteSttp'])->name('delete_sttp');
    Route::get('/sttp/edit', [TransaksiController::class, 'EditSttp'])->name('edit_sttp');

    Route::get('/input_material', [TransaksiController::class, 'PageInputMaterial'])->name('input_material');
    Route::get('/get_material', [TransaksiController::class, 'GetMaterial'])->name('get_material');
    Route::get('/get_material_lpbg', [TransaksiController::class, 'GetMaterialLpbg'])->name('get_material_lpbg');
    Route::get('/get_material_sttp', [TransaksiController::class, 'GetMaterialSttp'])->name('get_material_sttp');
    Route::post('/material/simpan', [TransaksiController::class, 'SimpanMaterial'])->name('simpan_material');
    Route::post('/material/simpan_material_lpbg', [TransaksiController::class, 'SimpanMaterialLpbg'])->name('simpan_material_lpbg');
    Route::post('/material/simpan_material_sttp', [TransaksiController::class, 'SimpanMaterialSttp'])->name('simpan_material_sttp');
    Route::post('/material/hapus', [TransaksiController::class, 'HapusMaterial'])->name('hapus_material');
    Route::post('/material/hapus_material_lpbg', [TransaksiController::class, 'HapusMaterialLpbg'])->name('hapus_material_lpbg');
    Route::post('/material/hapus_material_sttp', [TransaksiController::class, 'HapusMaterialSttp'])->name('hapus_material_sttp');
    Route::post('/material/hapus_lpbg', [TransaksiController::class, 'HapusLpbg'])->name('hapus_lpbg');

    Route::get('/lpbg', [TransaksiController::class, 'PageLpbg'])->name('lpbg');
    Route::get('/lpbg/edit', [TransaksiController::class, 'EditLpbg'])->name('edit_lpbg');
    Route::post('/lpbg/simpan', [TransaksiController::class, 'SimpanLpbg'])->name('simpan_lpbg');
});

Route::prefix('cetak-pdf')->name('cetakpdf.')->group(function () {
    Route::get('sttp', [CetakController::class, 'sttp'])->name('cetaksttp');
});

Route::prefix('cek')->name('cek.')->group(function () {
    Route::get('cek-by-lpbg', [CekController::class, 'CekLpbg'])->name('ceklpbg');
    Route::get('cek-by-sttp', [CekController::class, 'CekSttp'])->name('ceksttp');
});


Route::resource('post', PostsController::class);



Route::redirect('/', 'so');
