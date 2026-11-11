<?php

namespace App\Http\Controllers;

use App\Models\Dosen;
use App\Models\Krs;
use App\Models\Mahasiswa;
use App\Models\MataKuliah;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;

class DashboardController extends Controller
{
    public function index(): View
    {
        $totalKrs = Krs::count();

        $totalSks = (int) DB::table('krs_detail')
            ->join('mata_kuliah', 'mata_kuliah.id', '=', 'krs_detail.mata_kuliah_id')
            ->sum('mata_kuliah.sks');

        $statistik = [
            ['judul' => 'Mahasiswa', 'jumlah' => Mahasiswa::count(),
             'ikon' => 'bi-mortarboard-fill', 'warna' => 'primary'],
            ['judul' => 'Dosen', 'jumlah' => Dosen::count(),
             'ikon' => 'bi-person-badge-fill', 'warna' => 'success'],
            ['judul' => 'Mata Kuliah', 'jumlah' => MataKuliah::count(),
             'ikon' => 'bi-book-fill', 'warna' => 'warning'],
            ['judul' => 'Total KRS', 'jumlah' => $totalKrs,
             'ikon' => 'bi-journal-check', 'warna' => 'info'],
            ['judul' => 'Rata-rata SKS per KRS',
             'jumlah' => $totalKrs > 0 ? round($totalSks / $totalKrs) : 0,
             'ikon' => 'bi-calculator', 'warna' => 'danger'],
        ];

        $kolomKrs = [
            'nim' => 'NIM', 'nama' => 'Nama Mahasiswa',
            'sks' => 'SKS', 'status' => 'Status',
        ];

        $krsTerbaru = Krs::with('mahasiswa')
            ->withSum('mataKuliah as total_sks', 'sks')
            ->latest('id')
            ->limit(5)
            ->get()
            ->map(fn (Krs $k) => [
                'nim'    => $k->mahasiswa->nim,
                'nama'   => $k->mahasiswa->nama,
                'sks'    => (int) $k->total_sks,
                'status' => $k->status,
            ])
            ->all();

        $label = [
            'draft'     => ['Draft', 'secondary'],
            'diajukan'  => ['Diajukan', 'warning'],
            'disetujui' => ['Disetujui', 'success'],
            'ditolak'   => ['Ditolak', 'danger'],
        ];

        $perStatus = Krs::query()
            ->select('status', DB::raw('count(*) as jumlah'))
            ->groupBy('status')
            ->pluck('jumlah', 'status');

        $statusKrs = [];
        foreach ($label as $kunci => [$nama, $warna]) {
            $jumlah = (int) ($perStatus[$kunci] ?? 0);
            $statusKrs[] = [
                'label'  => $nama,
                'persen' => $totalKrs > 0 ? round($jumlah / $totalKrs * 100) : 0,
                'warna'  => $warna,
            ];
        }

        return view('dashboard', compact(
            'statistik', 'kolomKrs', 'krsTerbaru', 'statusKrs'
        ));
    }
}
