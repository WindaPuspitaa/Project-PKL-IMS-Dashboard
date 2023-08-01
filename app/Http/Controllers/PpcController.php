<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

class PpcController extends Controller
{
    public function InputMaterial(){
        return Inertia::render('Ppc/InputMaterial');
    }

    public function RealisasiMaterial(){
        return Inertia::render('Ppc/RealisasiMaterial');
    }
}
