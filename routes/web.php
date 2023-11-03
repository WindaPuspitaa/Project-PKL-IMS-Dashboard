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
    UserController,
    DataMasterController,
    ChartController
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

Route::post('login', [LoginController::class, 'authenticate'])->name('login');

Route::get('logout', [LoginController::class, 'logout'])->name('logout');

Route::prefix('so')->name('so.')->group(function () {
    Route::get('/', [SoContractController::class, 'index'])->name('index');
    Route::post('/', [SoContractController::class, 'indexPost'])->name('indexPost');
    Route::get('/getDataSo', [SoContractController::class, 'getDataSo'])->name('data');
});

Route::prefix('dashboard')->name('dashboard.')->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::get('/total-biaya', [DashboardController::class, 'pageTotalBiaya'])->name('pageTotalBiaya');
    Route::get('/top10-material', [DashboardController::class, 'pageTopTenMat'])->name('pageTopTenMat');
    Route::get('/realisasi-deviasi', [DashboardController::class, 'pageRealDev'])->name('pageRealDev');
    Route::get('/stok', [DashboardController::class, 'pageStok'])->name('pageStok');
    Route::get('/monitoring', [DashboardController::class, 'pageMonitoring'])->name('pageMonitoring');

    Route::get('/total-biaya/export-excel', [DashboardController::class, 'exportExcel'])->name('exportExcel');
});

Route::get('/stok', [DashboardController::class, 'stok']);
Route::get('/totalBiaya/{wbs_element}', [DashboardController::class, 'totalBiaya']);
Route::get('/topRawMat/{wbs_element}', [DashboardController::class, 'topExp']);
Route::get('/topComFas/{wbs_element}', [DashboardController::class, 'topExpCom']);
Route::get('/topTools/{wbs_element}', [DashboardController::class, 'topExpTools']);
Route::get('/topConsum/{wbs_element}', [DashboardController::class, 'topExpConsum']);
Route::get('/stokRawMat', [DashboardController::class, 'stokRawMat']);
Route::get('/stokComFas', [DashboardController::class, 'stokComFas']);
Route::get('/stokTools', [DashboardController::class, 'stokTools']);
Route::get('/stokConsum', [DashboardController::class, 'stokConsum']);

Route::get('/statusCounts', [DashboardController::class, 'statusCounts']);
Route::get('/qtyDiterima', [DashboardController::class, 'qtyDiterima']);

// Route data dari ChartController
Route::get('/chart-data', [ChartController::class, 'showChart']);
Route::get('/chart-data2', [ChartController::class, 'showChart2']);
Route::get('/chart-data3', [ChartController::class, 'showChart3']);
Route::get('/chart-data4', [ChartController::class, 'showChart4']);

Route::get('/data-sccConsumable', [ChartController::class, 'sccConsumable']);
Route::get('/data-sccTools', [ChartController::class, 'sccTools']);
Route::get('/data-sccRawMat', [ChartController::class, 'sccRawMat']);

Route::get('/data-totalBiaya', [ChartController::class, 'totalBiaya']);

Route::get('/data-pieComponent', [ChartController::class, 'pieComponent']);
Route::get('/data-pieTools', [ChartController::class, 'pieTools']);
Route::get('/data-pieConsumable', [ChartController::class, 'pieConsumable']);

Route::get('/data-topComponent', [ChartController::class, 'pieComponent']);
// Route data dari ChartController

// Route report
Route::get('/report', [ReportController::class, 'index'])->name('report');
// Route report_
Route::get('/report2', [ReportController::class, 'pageReport'])->name('pageReport');

Route::post('/report/export-excel', [ReportController::class, 'exportExcel'])->name('exportExcel');
Route::get('/export-data', [ReportController::class, 'exportData'])->name('exportData');
Route::post('/filter-data', [ReportController::class, 'filterData']);
Route::get('/dataReport', [ReportController::class, 'dataTable']);

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

Route::redirect('/', 'so');
