<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

class ChartController extends Controller
{
    public function showChart()
    {
        // $realisasi = [100, 50, 30, 20, 20, 10];
        // $deviasi = [0, 50, 20, 10, 0, 0, 10];
        // $kategori = ['k1', 'k2', 'k3', 'k4', 'k5', 'k6'];

        $chartData = [
            'labels' => ['Label 1', 'Label 2', 'Label 3'],
            'values' => [30, 45, 20],
        ];

        return response()->json($chartData);
    }
}
