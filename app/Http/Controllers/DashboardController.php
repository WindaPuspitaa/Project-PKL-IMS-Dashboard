<?php

namespace App\Http\Controllers;

use App\Exports\ExportTabel;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\MsMaterial;
use App\Models\MasMaterialType;
use App\Models\PoTransaction;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class DashboardController extends Controller
{
    public function index()
    {
        $stok = DB::table('po_transaction')
            ->selectRaw('SUM(item) as stok')
            ->get();
        $intStok = intval($stok->first()->stok);

        $tabelPo = DB::table('po_transaction as pt')
            ->join('ms_material as m', 'pt.material', '=', 'm.material_code')
            ->join('ms_material_type as mt', 'm.material_type', '=', 'mt.material_code')
            ->select('pt.purchasing_document', 'pt.vendor', 'mt.material_type', 'pt.material', 'pt.description', 'm.specification', 'pt.order_qty', 'pt.uom', 'pt.price_to_be_delivered', 'pt.currency')
            ->take(2)
            ->get();

        $totalBiaya = DB::table('fact_pembelian as fp')
            ->join('dim_material as m', 'fp.id_material', '=', 'm.id_material')
            ->groupBy('m.material_type')
            ->selectRaw('SUM(fp.total_harga) as total_akumulasi_harga, m.material_type')
            ->orderByDesc('total_akumulasi_harga')
            ->get();

        // dd($topExp);
        // exit;

        return Inertia::render('Dashboard/Dashboard', ['stok' => $intStok, 'tabelPo' => $tabelPo, 'totalBiaya' => $totalBiaya]);
    }

    public function pageTotalBiaya(Request $request)
    {
        $tabelPo = DB::table('po_transaction as pt')
            ->join('ms_material as m', 'pt.material', '=', 'm.material_code')
            ->join('ms_material_type as mt', 'm.material_type', '=', 'mt.material_code')
            ->select('pt.purchasing_document', 'pt.vendor', 'mt.material_type', 'pt.material', 'pt.description', 'm.specification', 'pt.order_qty', 'pt.uom', 'pt.price_to_be_delivered', 'pt.currency');

        $tabelPo = $tabelPo->paginate(5);

        $wbs_elements = DB::table('dim_wbs')
            ->get();

        // dd($wbs_element);
        // exit;

        if ($request->ajax()) {
            return response()->json(['data' => $tabelPo]);
        }

        return Inertia::render('Dashboard/TotalBiaya', ['tabelPo' => $tabelPo, 'wbs_elements' => $wbs_elements]);
    }

    public function pageTopTenMat()
    {
        $wbs_elements = DB::table('dim_wbs')
            ->get();

        return Inertia::render('Dashboard/TopTenMat', ['wbs_elements' => $wbs_elements]);
    }

    public function pageRealDev()
    {


        return Inertia::render('Dashboard/RealisasiDeviasi');
    }

    public function pageStok()
    {


        return Inertia::render('Dashboard/Stok');
    }

    public function pageMonitoring(Request $request)
    {
        $selectedStatus = $request->query('status');

        $dataMonitoring = DB::table('monitoring_po')
            ->select('pr', 'pr_date', 'po', 'nama_vendor', 'material', 'spesifikasi', 'start_date', 'end_date', 'uom', 'qty_order', 'diterima');

        $now = now();

        if ($selectedStatus == 'OVERDUE') {
            $dataMonitoring = $dataMonitoring->whereRaw('date(now()) > date(end_date) AND diterima < qty_order');
        } elseif ($selectedStatus === 'IN PROGRESS') {
            $dataMonitoring->whereRaw('date(now()) <= date(end_date) AND diterima < qty_order');
        } elseif ($selectedStatus === 'COMPLETE') {
            $dataMonitoring->where('diterima', '=', DB::raw('qty_order'));
        }

        $totalData = $dataMonitoring->count();

        $dataMonitoring = $dataMonitoring->paginate(5);

        $dataTabel = [];

        foreach ($dataMonitoring as $data) {
            $sisa = $data->qty_order - $data->diterima;

            $pr_date = Carbon::parse($data->pr_date)->format('d/m/Y');
            $start_date = Carbon::parse($data->start_date)->format('d/m/Y');
            $end_date = Carbon::parse($data->end_date)->format('d/m/Y');

            // $now = now();
            if ($now > $data->end_date && $data->diterima < $data->qty_order) {
                $status = 'OVERDUE';
            } elseif ($data->diterima < $data->qty_order) {
                $status = 'IN PROGRESS';
            } elseif ($data->qty_order === $data->diterima) {
                $status = 'COMPLETE';
            } else {
                $status = 'NOT STARTED';
            }

            $dataTabel[] = [
                'pr' => $data->pr,
                'pr_date' => $pr_date,
                'po' => $data->po,
                'nama_vendor' => $data->nama_vendor,
                'material' => $data->material,
                'spesifikasi' => $data->spesifikasi,
                'start_date' => $start_date,
                'end_date' => $end_date,
                'uom' => $data->uom,
                'qty_order' => $data->qty_order,
                'diterima' => $data->diterima,
                'sisa' => $sisa,
                'status' => $status,
            ];
        }

        if ($request->ajax()) {
            return response()->json(['data' => $dataTabel]);
        }

        return Inertia::render('Dashboard/Monitoring', [
            'data' => $dataTabel,
            // 'dataMonitoring' => $dataMonitoring,
            'dataMon' => ['data' => $dataTabel, 'total' => $totalData]
        ]);
    }

    public function statusCounts()
    {
        $dataMonitoring = DB::table('monitoring_po');

        $dataMonitoring = $dataMonitoring->paginate(10);

        $dataTabel = [];

        $series = [];

        foreach ($dataMonitoring as $data) {
            $sisa = $data->qty_order - $data->diterima;

            $now = now();
            if ($now > $data->end_date && $data->diterima < $data->qty_order) {
                $status = 'OVERDUE';
            } elseif ($data->diterima < $data->qty_order) {
                $status = 'IN PROGRESS';
            } elseif ($data->qty_order === $data->diterima) {
                $status = 'COMPLETE';
            } else {
                $status = 'NOT STARTED';
            }

            $dataTabel[] = [
                'pr' => $data->pr,
                'pr_date' => $data->pr_date,
                'po' => $data->po,
                'nama_vendor' => $data->nama_vendor,
                'material' => $data->material,
                'spesifikasi' => $data->spesifikasi,
                'start_date' => $data->start_date,
                'end_date' => $data->end_date,
                'uom' => $data->uom,
                'qty_order' => $data->qty_order,
                'diterima' => $data->diterima,
                'sisa' => $sisa,
                'status' => $status,
            ];

            if (!isset($series[$status])) {
                $series[$status] = 0;
            }
            $series[$status]++;
        }

        $statusCounts = [
            'categories' => array_keys($series),
            'series' => array_values($series),
        ];

        return response()->json($statusCounts);
    }

    public function qtyDiterima()
    {
        $query = DB::table('monitoring_po')
            ->selectRaw('material, qty_order, diterima')
            ->get();

        $qtyDiterima = [
            'categories' => $query->pluck('material')->toArray(),
            'qty_order' => $query->pluck('qty_order')->toArray(),
            'diterima' => $query->pluck('diterima')->toArray(),
        ];

        return response()->json($qtyDiterima);
    }

    public function totalBiaya(Request $request)
    {
        $selectedWbs = $request->route('wbs_element');

        $query = DB::table('fact_pembelian as fp')
            ->join('dim_material as m', 'fp.id_material', '=', 'm.id_material')
            ->leftJoin('dim_wbs as w', 'fp.id_wbs', '=', 'w.id_wbs')
            ->when($selectedWbs, function ($query, $selectedWbs) {
                return $query->where('w.wbs_element', 'LIKE', '%' . $selectedWbs . '%');
            })
            ->groupBy('m.material_type')
            ->selectRaw('SUM(fp.total_harga) as total_akumulasi_harga, m.material_type')
            ->orderByDesc('total_akumulasi_harga')
            ->get();

        $chartData = [
            'series' => $query->pluck('total_akumulasi_harga')->map(function ($item) {
                return (float) $item;
            })->toArray(),
            'categories' => $query->pluck('material_type')->toArray(),
        ];
        // dd($chartData);
        // exit;

        // return Inertia::render('Dashboard/totalBiaya', ['wbs_element' => $wbs_element]);
        return response()->json($chartData);
    }

    //Top expensive
    public function topExp(Request $request)
    {
        // $selectedWbs = $request->route('id_wbs');

        // $query = DB::table('fact_toptenexp as ft')
        //     ->join('dim_material as m', 'ft.id_material', '=', 'm.id_material')
        //     ->leftJoin('dim_wbs as w', 'ft.id_wbs', '=', 'w.id_wbs')
        //     ->where('m.material_type_code', '=', 'ZROH')
        //     ->when($selectedWbs, function ($query, $selectedWbs) {
        //         return $query->whereIn('w.id_wbs', explode(',', $selectedWbs));
        //     })
        //     ->groupBy('m.material_code', 'ft.harga_per_item')
        //     ->select('ft.harga_per_item', 'm.material_code')
        //     ->orderByDesc('ft.harga_per_item')
        //     ->take(10)
        //     ->get();

        $selectedWbs = $request->route('wbs_element'); // Ganti 'id_wbs' dengan 'wbs_element' sesuai dengan kebutuhan Anda.

        $query = DB::table('fact_toptenexp as ft')
            ->join('dim_material as m', 'ft.id_material', '=', 'm.id_material')
            ->leftJoin('dim_wbs as w', 'ft.id_wbs', '=', 'w.id_wbs')
            ->where('m.material_type_code', '=', 'ZROH')
            ->when($selectedWbs, function ($query, $selectedWbs) {
                return $query->where('w.wbs_element', 'LIKE', '%' . $selectedWbs . '%');
            })
            ->groupBy('m.material_code', 'ft.harga_per_item')
            ->select('ft.harga_per_item', 'm.material_code')
            ->orderByDesc('ft.harga_per_item')
            ->take(10)
            ->get();

        $chartData = [
            'series' => $query->pluck('harga_per_item')->toArray(),
            'categories' => $query->pluck('material_code')->toArray(),
        ];

        // dd($chartData);
        // exit;

        return response()->json($chartData);
    }

    public function topExpCom(Request $request)
    {
        // $selectedWbs = $request->route('id_wbs');

        // $query = DB::table('fact_toptenexp as ft')
        //     ->join('dim_material as m', 'ft.id_material', '=', 'm.id_material')
        //     ->leftJoin('dim_wbs as w', 'ft.id_wbs', '=', 'w.id_wbs')
        //     ->where('m.material_type_code', '=', 'ZKOM')
        //     ->when($selectedWbs, function ($query, $selectedWbs) {
        //         return $query->whereIn('w.id_wbs', explode(',', $selectedWbs));
        //     })
        //     ->groupBy('m.material_code', 'ft.harga_per_item')
        //     ->select('ft.harga_per_item', 'm.material_code')
        //     ->orderByDesc('ft.harga_per_item')
        //     ->take(10)
        //     ->get();

        $selectedWbs = $request->route('wbs_element');

        $query = DB::table('fact_toptenexp as ft')
            ->join('dim_material as m', 'ft.id_material', '=', 'm.id_material')
            ->leftJoin('dim_wbs as w', 'ft.id_wbs', '=', 'w.id_wbs')
            ->where('m.material_type_code', '=', 'ZKOM')
            ->when($selectedWbs, function ($query, $selectedWbs) {
                return $query->where('w.wbs_element', 'LIKE', '%' . $selectedWbs . '%');
            })
            ->groupBy('m.material_code', 'ft.harga_per_item')
            ->select('ft.harga_per_item', 'm.material_code')
            ->orderByDesc('ft.harga_per_item')
            ->take(10)
            ->get();

        $chartData = [
            'series' => $query->pluck('harga_per_item')->toArray(),
            'categories' => $query->pluck('material_code')->toArray(),
        ];

        // dd($chartData);
        // exit;

        return response()->json($chartData);
    }

    public function topExpTools(Request $request)
    {
        // $selectedWbs = $request->route('id_wbs');

        // $query = DB::table('fact_toptenexp as ft')
        //     ->join('dim_material as m', 'ft.id_material', '=', 'm.id_material')
        //     ->leftJoin('dim_wbs as w', 'ft.id_wbs', '=', 'w.id_wbs')
        //     ->where('m.material_type_code', '=', 'ZPRT')
        //     ->when($selectedWbs, function ($query, $selectedWbs) {
        //         return $query->whereIn('w.id_wbs', explode(',', $selectedWbs));
        //     })
        //     ->groupBy('m.material_code', 'ft.harga_per_item')
        //     ->select('ft.harga_per_item', 'm.material_code')
        //     ->orderByDesc('ft.harga_per_item')
        //     ->take(10)
        //     ->get();

        $selectedWbs = $request->route('wbs_element'); // Ganti 'id_wbs' dengan 'wbs_element' sesuai dengan kebutuhan Anda.

        $query = DB::table('fact_toptenexp as ft')
            ->join('dim_material as m', 'ft.id_material', '=', 'm.id_material')
            ->leftJoin('dim_wbs as w', 'ft.id_wbs', '=', 'w.id_wbs')
            ->where('m.material_type_code', '=', 'ZPRT')
            ->when($selectedWbs, function ($query, $selectedWbs) {
                return $query->where('w.wbs_element', 'LIKE', '%' . $selectedWbs . '%');
            })
            ->groupBy('m.material_code', 'ft.harga_per_item')
            ->select('ft.harga_per_item', 'm.material_code')
            ->orderByDesc('ft.harga_per_item')
            ->take(10)
            ->get();

        $chartData = [
            'series' => $query->pluck('harga_per_item')->toArray(),
            'categories' => $query->pluck('material_code')->toArray(),
        ];

        // dd($chartData);
        // exit;

        return response()->json($chartData);
    }

    public function topExpConsum(Request $request)
    {
        // $selectedWbs = $request->route('id_wbs');

        // $query = DB::table('fact_toptenexp as ft')
        //     ->join('dim_material as m', 'ft.id_material', '=', 'm.id_material')
        //     ->leftJoin('dim_wbs as w', 'ft.id_wbs', '=', 'w.id_wbs')
        //     ->where('m.material_type_code', '=', 'ZIBE')
        //     ->when($selectedWbs, function ($query, $selectedWbs) {
        //         return $query->whereIn('w.id_wbs', explode(',', $selectedWbs));
        //     })
        //     ->groupBy('m.material_code', 'ft.harga_per_item')
        //     ->select('ft.harga_per_item', 'm.material_code')
        //     ->orderByDesc('ft.harga_per_item')
        //     ->take(10)
        //     ->get();

        $selectedWbs = $request->route('wbs_element'); // Ganti 'id_wbs' dengan 'wbs_element' sesuai dengan kebutuhan Anda.

        $query = DB::table('fact_toptenexp as ft')
            ->join('dim_material as m', 'ft.id_material', '=', 'm.id_material')
            ->leftJoin('dim_wbs as w', 'ft.id_wbs', '=', 'w.id_wbs')
            ->where('m.material_type_code', '=', 'ZIBE')
            ->when($selectedWbs, function ($query, $selectedWbs) {
                return $query->where('w.wbs_element', 'LIKE', '%' . $selectedWbs . '%');
            })
            ->groupBy('m.material_code', 'ft.harga_per_item')
            ->select('ft.harga_per_item', 'm.material_code')
            ->orderByDesc('ft.harga_per_item')
            ->take(10)
            ->get();

        $chartData = [
            'series' => $query->pluck('harga_per_item')->toArray(),
            'categories' => $query->pluck('material_code')->toArray(),
        ];

        // dd($chartData);
        // exit;

        return response()->json($chartData);
    }

    // Stok : Akan dibeli
    public function stokRawMat()
    {
        $result = DB::table('po_transaction as pt')
            ->join('ms_material as m', 'pt.material', '=', 'm.material_code')
            ->join('ms_material_type as mt', 'm.material_type', '=', 'mt.material_code')
            ->where('mt.material_type', 'Raw Material')
            ->selectRaw('SUM(pt.item) as stok, SUM(pt.order_qty) as akan_dibeli')
            ->get();

        $chartData = [
            'values' => [intval($result[0]->akan_dibeli), intval($result[0]->stok)],
            'labels' => ['Akan dibeli', 'Stok'],
        ];

        // dd($chartData);
        // exit;

        return response()->json($chartData);
    }

    public function stokComFas()
    {
        $result = DB::table('po_transaction as pt')
            ->join('ms_material as m', 'pt.material', '=', 'm.material_code')
            ->join('ms_material_type as mt', 'm.material_type', '=', 'mt.material_code')
            ->where('mt.material_type', 'Component & Fastening')
            ->selectRaw('SUM(pt.item) as stok, SUM(pt.order_qty) as akan_dibeli')
            ->get();

        $chartData = [
            'values' => [intval($result[0]->akan_dibeli), intval($result[0]->stok)],
            'labels' => ['Akan dibeli', 'Stok'],
        ];

        // dd($chartData);
        // exit;

        return response()->json($chartData);
    }

    public function stokTools()
    {
        $result = DB::table('po_transaction as pt')
            ->join('ms_material as m', 'pt.material', '=', 'm.material_code')
            ->join('ms_material_type as mt', 'm.material_type', '=', 'mt.material_code')
            ->where('mt.material_type', 'Tools')
            ->selectRaw('SUM(pt.item) as stok, SUM(pt.order_qty) as akan_dibeli')
            ->get();

        $chartData = [
            'values' => [intval($result[0]->akan_dibeli), intval($result[0]->stok)],
            'labels' => ['Akan dibeli', 'Stok'],
        ];

        // dd($chartData);
        // exit;

        return response()->json($chartData);
    }

    public function stokConsum()
    {
        $result = DB::table('po_transaction as pt')
            ->join('ms_material as m', 'pt.material', '=', 'm.material_code')
            ->join('ms_material_type as mt', 'm.material_type', '=', 'mt.material_code')
            ->where('mt.material_type', 'Consumable')
            ->selectRaw('SUM(pt.item) as stok, SUM(pt.order_qty) as akan_dibeli')
            ->get();

        $chartData = [
            'values' => [intval($result[0]->akan_dibeli), intval($result[0]->stok)],
            'labels' => ['Akan dibeli', 'Stok'],
        ];

        // dd($chartData);
        // exit;

        return response()->json($chartData);
    }

    // public function exportExcel(Request $request)
    // {
    //     return Excel::download(new ExportTabel, 'report.xlsx');
    // }
}
