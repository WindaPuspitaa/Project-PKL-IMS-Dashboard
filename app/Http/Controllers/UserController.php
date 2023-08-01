<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;
use App\Models\User;

class UserController extends Controller
{
    public function index(Request $request)
    {
        $title = 'User';
        $users = User::select('id', 'name', 'email', 'nip')->paginate(10);
        if ($request->ajax()) {
            return response()->json(['data' => $users, 'message' => 'Berhasil di dapat']);
        }
        return Inertia::render('ManageUser/User', [
            'title' => $title,
            'users' => $users
        ]);
    }
    public function create()
    {
        return Inertia::render('ManageUser/CreateUser');
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
        // Validasi data input sesuai kebutuhan Anda
        $validatedData = $request->validate([
            'id' => 'required|exists:users,id', // Pastikan input "id" ada dalam tabel users
        ]);

        // Cari data user berdasarkan id yang diterima dari Vue.js
        $user = User::findOrFail($validatedData['id']);

        // Hapus data user
        $user->delete();

        return response()->json(['message' => 'Data user berhasil dihapus']);
    }
    // public function store(Request $request)
    // {
    //     $request->validate([
    //         'nama' => 'required',
    //         'email' => 'required|email|unique:users,email',
    //         'nip' => 'required',
    //     ]);

    //     User::create([
    //         'name' => $request->input('nama'),
    //         'email' => $request->input('email'),
    //         'nip' => $request->input('nip'),
    //         'password' => $request->input('password'),
    //     ]);

    //     return redirect()->route('/manage-user');
    // }

    // public function edit(User $user)
    // {
    //     return Inertia::render('ManageUser/EditUser', [
    //         'user' => $user,
    //     ]);
    // }

    // public function update(Request $request, User $user)
    // {
    //     $user->update([
    //         'name' => $request->input('nama'),
    //         'email' => $request->input('email'),
    //         'nip' => $request->input('nip'),
    //     ]);

    //     return redirect()->route('/manage-user');
    // }

    // public function destroy($id)
    // {
    //     $user = User::findOrFail($id);
    //     $user->delete();

    //     return redirect()->back();
    // }


    // public function index()
    // {
    //     $title = 'User';
    //     $users = User::all();
    //     return Inertia::render('ManageUser/User', [
    //         'title' => $title,
    //         'users' => $users
    //     ]);
    // }
}
