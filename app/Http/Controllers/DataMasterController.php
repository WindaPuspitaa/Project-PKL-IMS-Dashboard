<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\User;
use App\Models\MasterProyek;

class DataMasterController extends Controller
{
    public function pageUser(Request $request)
    {
        $title = 'User';
        $users = User::select('id', 'name', 'email', 'nip')->paginate(10);
        if ($request->ajax()) {
            return response()->json(['data' => $users, 'message' => 'Berhasil di dapat']);
        }
        return Inertia::render('DataMaster/User', [
            'title' => $title,
            'users' => $users
        ]);
    }

    public function simpanUser(Request $request)
    {


        if ($request->input('id')) {

            $user = User::where("id", $request->input('id'))->first();
            $user->update([
                'name' => $request->input('name'),
                'email' => $request->input('email'),
                'nip' => $request->input('nip'),
            ]);
        } else {
            $validatedData = $request->validate([
                'name' => 'required|string|max:255',
                'email' => 'required|email|unique:users,email', // pastikan kolom email unik dalam tabel users
                'nip' => 'required|string|max:50',
                'password' => 'required|string|min:6', // atau sesuaikan dengan kebutuhan Anda
            ]);
            $users = User::create(
                [
                    'name' => $validatedData['name'],
                    'email' => $validatedData['email'],
                    'nip' => $validatedData['nip'],
                    'password' => bcrypt($validatedData['password']), // Pastikan Anda menyimpan password yang di-hash
                ]
            );
        }


        return response()->json(['message' => 'Data user berhasil disimpan']);
    }

    public function hapusUser(Request $request)
    {
        $validatedData = $request->validate([
            'id' => 'required|exists:users,id',
        ]);

        $user = User::findOrFail($validatedData['id']);

        $user->delete();

        return response()->json(['message' => 'Data user berhasil dihapus']);
    }

    public function pageProyek(Request $request)
    {
        $title = 'Proyek';
        $proyek = MasterProyek::select('id', 'kode_proyek', 'nama_proyek')->paginate(10);
        if ($request->ajax()) {
            return response()->json(['data' => $proyek, 'message' => 'Berhasil di dapat']);
        }
        return Inertia::render('DataMaster/Proyek', [
            'title' => $title,
            'proyek' => $proyek
        ]);
    }

    public function simpanProyek(Request $request)
    {


        if ($request->input('id')) {

            $proyek = MasterProyek::where("id", $request->input('id'))->first();
            $proyek->update([
                'kode_proyek' => $request->input('kode_proyek'),
                'nama_proyek' => $request->input('nama_proyek'),
            ]);
        } else {
            $validatedData = $request->validate([
                'nama_proyek' => 'required|string|max:255',
                'kode_proyek' => 'required|string|max:255',
            ]);
            $proyeks = MasterProyek::create(
                [
                    'kode_proyek' => $validatedData['kode_proyek'],
                    'nama_proyek' => $validatedData['nama_proyek'],
                ]
            );
        }


        return response()->json(['message' => 'Data user berhasil disimpan']);
    }

    public function hapusProyek(Request $request)
    {
        $validatedData = $request->validate([
            'id' => 'required|exists:master_proyek,id',
        ]);

        $proyek = MasterProyek::findOrFail($validatedData['id']);

        $proyek->delete();

        return response()->json(['message' => 'Data proyek berhasil dihapus']);
    }
}
