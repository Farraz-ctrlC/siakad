<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\BerandaController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DosenController;
use App\Http\Controllers\KrsController;
use App\Http\Controllers\MahasiswaController;
use App\Http\Controllers\MataKuliahController;
use App\Http\Controllers\PenggunaController;
use Illuminate\Support\Facades\Route;

Route::middleware('guest')->group(function () {
    Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
    Route::post('/login', [LoginController::class, 'authenticate'])->name('login.attempt');
});

Route::middleware('auth')->group(function () {
    Route::get('/', fn () => redirect()->route('dashboard'));

    Route::post('/logout', [LoginController::class, 'logout'])->name('logout');

    Route::get('/dashboard', [DashboardController::class, 'index'])
        ->name('dashboard');

    // Endpoint JSON untuk Yajra DataTables (harus sebelum route {param})
    Route::get('/dosen/data', [DosenController::class, 'data'])->name('dosen.data');
    Route::get('/mahasiswa/data', [MahasiswaController::class, 'data'])->name('mahasiswa.data');
    Route::get('/mata-kuliah/data', [MataKuliahController::class, 'data'])->name('matakuliah.data');
    Route::get('/krs/data', [KrsController::class, 'data'])->name('krs.data');

    // Hanya admin: tambah, ubah, hapus
    Route::middleware('role:admin')->group(function () {
        Route::resource('dosen', DosenController::class)
            ->except(['index', 'show']);

        Route::resource('mahasiswa', MahasiswaController::class)
            ->parameters(['mahasiswa' => 'mahasiswa'])
            ->except(['index', 'show']);

        Route::resource('mata-kuliah', MataKuliahController::class)
            ->parameters(['mata-kuliah' => 'mataKuliah'])
            ->names('matakuliah')
            ->except(['index', 'show']);

        Route::resource('krs', KrsController::class)
            ->parameters(['krs' => 'krs'])
            ->except(['index', 'show']);
    });

    // Semua pengguna login: lihat data
    Route::resource('dosen', DosenController::class)->only(['index', 'show']);

    Route::resource('mahasiswa', MahasiswaController::class)
        ->parameters(['mahasiswa' => 'mahasiswa'])
        ->only(['index', 'show']);

    Route::resource('mata-kuliah', MataKuliahController::class)
        ->parameters(['mata-kuliah' => 'mataKuliah'])
        ->names('matakuliah')
        ->only(['index']);

    Route::resource('krs', KrsController::class)
        ->parameters(['krs' => 'krs'])
        ->only(['index', 'show']);

    Route::get('/beranda', [BerandaController::class, 'index'])->name('beranda');

    Route::get('/pengguna', [PenggunaController::class, 'index'])
        ->middleware('role:admin')
        ->name('pengguna.index');
});
