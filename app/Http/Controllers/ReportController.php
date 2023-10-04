<?php

namespace App\Http\Controllers;

use App\Exports\ExportTabel;
use App\Exports\ReportExport;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;

class ReportController extends Controller
{
    public function index(Request $request)
    {
        $tabelPo = DB::table('po_transaction as pt')
            ->join('ms_material as m', 'pt.material', '=', 'm.material_code')
            ->join('ms_material_type as mt', 'm.material_type', '=', 'mt.material_code')
            ->select('pt.wbs_element', 'pt.purchasing_document', 'pt.vendor', 'mt.material_type', 'pt.material', 'pt.description', 'm.specification', 'pt.order_qty', 'pt.uom', 'pt.price_to_be_delivered', 'pt.currency')
            ->paginate(10);

        // dd($query);
        // exit;

        // $tabelPo = $tabelPo->paginate(10);

        if ($request->ajax()) {
            return response()->json(['data' => $tabelPo]);
        }

        return Inertia::render('Report/Report', ['tabelPo' => $tabelPo]);
        // return Inertia::render('Report/Report');
    }

    public function dataTable(Request $request)
    {
        $tabelPo = DB::table('po_transaction as pt')
            ->join('ms_material as m', 'pt.material', '=', 'm.material_code')
            ->join('ms_material_type as mt', 'm.material_type', '=', 'mt.material_code')
            ->select('pt.wbs_element', 'pt.purchasing_document', 'pt.vendor', 'mt.material_type', 'pt.material', 'pt.description', 'm.specification', 'pt.order_qty', 'pt.uom', 'pt.price_to_be_delivered', 'pt.currency')
            ->paginate(10);

        // dd($tabelPo);
        // exit;

        // $tabelPo = $tabelPo->paginate(10);


        return response()->json($tabelPo);
    }

    public function pageReport(Request $request)
    {
        $project = $request->query('project');
        $year = $request->query('year');

        $tabelPo = DB::table('po_transaction as pt')
            ->join('ms_material as m', 'pt.material', '=', 'm.material_code')
            ->join('ms_material_type as mt', 'm.material_type', '=', 'mt.material_code')
            ->select('pt.wbs_element', 'pt.purchasing_document', 'pt.vendor', 'mt.material_type', 'pt.material', 'pt.description', 'm.specification', 'pt.order_qty', 'pt.uom', 'pt.price_to_be_delivered', 'pt.currency', 'pt.document_date');

        if ($project) {
            $tabelPo = $tabelPo->where('pt.wbs_element', 'LIKE', "%$project%");
        }

        if ($year) {
            $tabelPo = $tabelPo->whereYear('pt.document_date', '=', $year);
        }

        // dd($query);
        // exit;

        $tabelPo = $tabelPo->paginate(10);

        if ($request->ajax()) {
            return response()->json(['data' => $tabelPo]);
        }

        return Inertia::render('Report/Report_', ['tabelPo' => $tabelPo]);
    }

    // public function exportExcel()
    // {
    //     return Excel::download(new ExportTabel, 'report.xlsx');
    // }

    public function exportExcel(Request $request)
    {
        $selectedColumns = $request->input('filters', []);
        $selectedProject = $request->input('filterProject');
        $selectedYear = $request->input('filterYear');

        $column = [];
        foreach ($selectedColumns as $key => $value) {
            if ($value) {
                $column[] = $key;
            }
        }
        $column = implode(",", $column);

        $params = [
            'filters' => $column,
            'filterProject' => $selectedProject,
            'filterYear' => $selectedYear
        ];

        // dd($params);
        // exit;
        return Excel::download(new ExportTabel($params), 'report.xlsx');
    }
}
