<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

class ChartController extends Controller
{
    public function showChart()
    {
        $chartData = [
            'labels' => [
                'Raw Mat 1', 'Raw Mat 2', 'Raw Mat 3', 'Raw Mat 4', 'Raw Mat 5', 'Raw Mat 5',
                'Raw Mat 6', 'Raw Mat 7', 'Raw Mat 8', 'Raw Mat 9', 'Raw Mat 10'
            ],
            'values' => [
                2500000000, 1500000000, 1200000000, 1000000000, 900000000, 750000000,
                600000000, 500000000, 250000000, 200000000, 100000000
            ],
        ];

        // return Inertia::render('Dashboard/Dashboard', ['chartData' => $chartData]);
        // return Inertia::render('Dashboard/Dashboard', ['chartData' => $chartData]);
        return response()->json($chartData);
    }
    public function topComponent()
    {
        $topComponent = [
            'labels' => [
                'Raw Mat 1', 'Raw Mat 2', 'Raw Mat 3', 'Raw Mat 4', 'Raw Mat 5', 'Raw Mat 5',
                'Raw Mat 6', 'Raw Mat 7', 'Raw Mat 8', 'Raw Mat 9', 'Raw Mat 10'
            ],
            'values' => [
                2500000000, 1500000000, 1200000000, 1000000000, 900000000, 750000000,
                600000000, 500000000, 250000000, 200000000, 100000000
            ],
        ];

        return response()->json($topComponent);
    }
    public function topTools()
    {
        $topTools = [
            'labels' => [
                'Raw Mat 1', 'Raw Mat 2', 'Raw Mat 3', 'Raw Mat 4', 'Raw Mat 5', 'Raw Mat 5',
                'Raw Mat 6', 'Raw Mat 7', 'Raw Mat 8', 'Raw Mat 9', 'Raw Mat 10'
            ],
            'values' => [
                2500000000, 1500000000, 1200000000, 1000000000, 900000000, 750000000,
                600000000, 500000000, 250000000, 200000000, 100000000
            ],
        ];

        return response()->json($topTools);
    }
    public function topConsumable()
    {
        $topConsumable = [
            'labels' => [
                'Raw Mat 1', 'Raw Mat 2', 'Raw Mat 3', 'Raw Mat 4', 'Raw Mat 5', 'Raw Mat 5',
                'Raw Mat 6', 'Raw Mat 7', 'Raw Mat 8', 'Raw Mat 9', 'Raw Mat 10'
            ],
            'values' => [
                2500000000, 1500000000, 1200000000, 1000000000, 900000000, 750000000,
                600000000, 500000000, 250000000, 200000000, 100000000
            ],
        ];

        return response()->json($topConsumable);
    }

    public function showChart2()
    {
        $chartData = [
            'categories' => ['BOM', 'PR', 'PO', 'GR1 03', 'GR1 05', 'STOK', 'BPM'],
            'dataSets' => [
                [
                    'nama' => 'Realisasi',
                    'data' => [80, 50, 40, 20, 20, 20, 20],
                ],
                [
                    'nama' => 'Deviasi',
                    'data' => [0, 30, 10, 20, 20, 0, 0, 0],
                ],
            ],
        ];

        return response()->json($chartData);
        // return Inertia::render('Dashboard/Dashboard', [
        //     'chartData' => $chartData,
        // ]);
    }

    //Data Stacked Column Chart
    public function showChart3() //sccComFas
    {
        $chartData = [
            'categories' => ['BOM', 'PR', 'PO', 'GR1 03', 'GR1 05', 'STOK', 'BPM'],
            'dataSets' => [
                [
                    'nama' => 'Realisasi',
                    'data' => [80, 50, 40, 20, 20, 20, 20],
                ],
                [
                    'nama' => 'Deviasi',
                    'data' => [0, 30, 10, 20, 20, 0, 0, 0],
                ],
            ],
        ];

        return response()->json($chartData);
        // return Inertia::render('Dashboard/Dashboard', [
        //     'chartData' => $chartData,
        // ]);
    }

    public function sccRawMat()
    {
        $rawMat = [
            'categories' => ['BOM', 'PR', 'PO', 'GR1 03', 'GR1 05', 'STOK', 'BPM'],
            'dataSets' => [
                [
                    'nama' => 'Realisasi',
                    'data' => [100, 80, 70, 60, 50, 50, 30],
                ],
                [
                    'nama' => 'Deviasi',
                    'data' => [0, 20, 10, 10, 10, 0, 20],
                ],
            ],
        ];

        return response()->json($rawMat);
    }
    public function sccTools()
    {
        $tools = [
            'categories' => ['BOM', 'PR', 'PO', 'GR1 03', 'GR1 05', 'STOK', 'BPM'],
            'dataSets' => [
                [
                    'nama' => 'Realisasi',
                    'data' => [100, 45, 25, 20, 20, 20, 10],
                ],
                [
                    'nama' => 'Deviasi',
                    'data' => [0, 45, 20, 10, 0, 0, 10],
                ],
            ],
        ];

        return response()->json($tools);
    }
    public function sccConsumable()
    {
        $consumable = [
            'categories' => ['BOM', 'PR', 'PO', 'GR1 03', 'GR1 05', 'STOK', 'BPM'],
            'dataSets' => [
                [
                    'nama' => 'Realisasi',
                    'data' => [30, 25, 20, 15, 15, 15, 5],
                ],
                [
                    'nama' => 'Deviasi',
                    'data' => [0, 5, 5, 10, 0, 0, 10],
                ],
            ],
        ];

        return response()->json($consumable);
    }

    public function totalBiaya()
    {
        $totalBiaya = [
            'labels' => ['Raw Material', 'Component & Fastening', 'Tools', 'Consumable & CB Tools'],
            'values' => [10000000, 8000000, 5000000, 6000000],
        ];

        // return Inertia::render('Dashboard/Dashboard', ['chartData' => $chartData]);
        // return Inertia::render('Dashboard/Dashboard', ['chartData' => $chartData]);
        return response()->json($totalBiaya);
    }

    public function showChart4()
    {
        $chartData = [
            'labels' => ['Akan dibeli', 'Stok'],
            'values' => [17, 7],
        ];

        // return Inertia::render('Dashboard/Dashboard', ['chartData' => $chartData]);
        // return Inertia::render('Dashboard/Dashboard', ['chartData' => $chartData]);
        return response()->json($chartData);
    }
    public function pieComponent()
    {
        $pieComponet = [
            'labels' => ['Akan dibeli', 'Stok'],
            'values' => [100, 25],
        ];

        return response()->json($pieComponet);
    }
    public function pieTools()
    {
        $pieTools = [
            'labels' => ['Akan dibeli', 'Stok'],
            'values' => [75, 25],
        ];

        return response()->json($pieTools);
    }
    public function pieConsumable()
    {
        $pieConsumable = [
            'labels' => ['Akan dibeli', 'Stok'],
            'values' => [250, 100],
        ];

        return response()->json($pieConsumable);
    }
}
