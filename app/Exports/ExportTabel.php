<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Illuminate\Support\Facades\DB;

class ExportTabel implements FromCollection
{
    /**
     * @return \Illuminate\Support\Collection
     */

    protected $params;
    public function __construct($params)
    {
        $this->params = $params;
    }

    public function collection()
    {
        $tabelPo = DB::table('po_transaction as pt')
            ->join('ms_material as m', 'pt.material', '=', 'm.material_code')
            ->join('ms_material_type as mt', 'm.material_type', '=', 'mt.material_code')
            ->selectRaw($this->params['filters'])
            ->where('pt.wbs_element', 'LIKE', '%' . $this->params['filterProject'] . '%')
            ->whereYear('pt.document_date', '=', $this->params['filterYear'])
            ->get();

        return $tabelPo;
    }
}
