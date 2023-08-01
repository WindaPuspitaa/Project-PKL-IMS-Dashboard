<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MasterProyek extends Model
{
    protected $table = 'master_proyek';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'kode_proyek',
        'nama_proyek',
    ];

    protected $primaryKey = 'id';
    protected $guarded = [];
}
