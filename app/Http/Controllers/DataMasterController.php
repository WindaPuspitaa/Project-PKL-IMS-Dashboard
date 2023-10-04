<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\User;
use App\Models\MasterProyek;
use Illuminate\Support\Facades\DB;

class DataMasterController extends Controller
{
    public function pageUser(Request $request)
    {
        $search = $request->input('search');

        $title = 'User';
        $users = User::select('users.id', 'users.name', 'users.email', 'users.nip', 'users.role_id', 'r.name as role_name')
            ->leftjoin('roles as r', 'r.id', '=', 'users.role_id');
        // dd($users);
        // exit;
        $roles = DB::table('roles')
            ->get();

        if ($search) {
            $users = $users->where('users.name', 'LIKE', "%$search%")
                ->orWhere('users.email', 'LIKE', "%$search%")
                ->orWhere('users.nip', 'LIKE', "%$search%")
                ->orWhere('r.name', 'LIKE', "%$search%");
        }

        $users = $users->paginate(5);

        if ($request->ajax()) {
            return response()->json(['data' => $users, 'message' => 'Berhasil di dapat']);
        }

        return Inertia::render('DataMaster/User', [
            'title' => $title,
            'users' => $users,
            'roles' => $roles
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
                'role_id' => $request->input('role_id')
            ]);
        } else {
            $validatedData = $request->validate([
                'name' => 'required|string|max:255',
                'email' => 'required|email|unique:users,email',
                'nip' => 'required',
                'password' => 'required|string|min:6',
                'role_id' => 'required'
            ]);
            $users = User::create(
                [
                    'name' => $validatedData['name'],
                    'email' => $validatedData['email'],
                    'nip' => $validatedData['nip'],
                    'password' => bcrypt($validatedData['password']),
                    'role_id' => $validatedData['role_id']
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
        $search = $request->input('search');

        $title = 'Proyek';
        $proyek = MasterProyek::select('id', 'kode_proyek', 'nama_proyek');

        if ($search) {
            $proyek = $proyek->where('kode_proyek', 'LIKE', "%$search%")
                ->orWhere('nama_proyek', 'LIKE', "%$search%");
        }

        $proyek = $proyek->paginate(5);

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
