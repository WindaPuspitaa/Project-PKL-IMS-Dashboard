<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Illuminate\Support\Facades\DB;

class ReportExport implements FromQuery, WithHeadings
{
    use Exportable;

    protected $selectedFilter;
    protected $filterValue;

    public function __construct($selectedFilter, $filterValue)
    {
        $this->selectedFilter = $selectedFilter;
        $this->filterValue = $filterValue;
    }

    public function query()
    {
        // Buat kueri sesuai dengan filter yang dipilih
        $query = DB::table('po_transaction as pt')
            ->join('ms_material as m', 'pt.material', '=', 'm.material_code')
            ->join('ms_material_type as mt', 'm.material_type', '=', 'mt.material_code');

        if ($this->selectedFilter === 'all') {
            // Tidak perlu menambahkan filter tambahan
        } elseif ($this->selectedFilter === 'top10') {
            $query->orderBy('pt.price_to_be_delivered', 'desc')->take($this->filterValue);
        } elseif ($this->selectedFilter === 'top50') {
            $query->orderBy('pt.price_to_be_delivered', 'desc')->take($this->filterValue);
        }

        return $query;
    }

    public function headings(): array
    {
        // Sesuaikan dengan header kolom yang sesuai dengan data yang akan diekspor
        return [
            'Purchasing Document',
            'Vendor',
            'Material Type',
            'Material',
            'Description',
            'Specification',
            'Quantity',
            'UoM',
            'Price',
        ];
    }
}
