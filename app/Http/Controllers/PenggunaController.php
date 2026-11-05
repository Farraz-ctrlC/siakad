<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\View\View;

class PenggunaController extends Controller
{
    public function index(): View
    {
        $kolom = [
            'name' => 'Nama',
            'email' => 'Email',
            'role' => 'Peran',
            'last_login_at' => 'Terakhir Login',
        ];

        $pengguna = User::orderBy('name')
            ->get(['name', 'email', 'role', 'last_login_at'])
            ->map(function ($user) {
                return [
                    'name' => $user->name,
                    'email' => $user->email,
                    'role' => $user->role,
                    'last_login_at' => $user->last_login_at 
                        ? $user->last_login_at->translatedFormat('d M Y, H:i') 
                        : 'Belum pernah',
                ];
            })
            ->toArray();

        return view('pengguna.index', compact('kolom', 'pengguna'));
    }
}