<?php

namespace App\Http\Controllers;

use App\Models\Krs;
use App\Models\Mahasiswa;
use App\Models\MataKuliah;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;
use Illuminate\View\View;
use Yajra\DataTables\Facades\DataTables;

class KrsController extends Controller
{
    public function index(): View
    {
        return view('krs.index');
    }

    public function data(): JsonResponse
    {
        $query = Krs::query()
            ->join('mahasiswa', 'mahasiswa.id', '=', 'krs.mahasiswa_id')
            ->select([
                'krs.id', 'krs.mahasiswa_id', 'krs.tahun_akademik', 'krs.semester',
                'mahasiswa.nim', 'mahasiswa.nama as nama_mahasiswa',
            ])
            ->withCount('mataKuliah as jumlah_mk')
            ->withSum('mataKuliah as total_sks', 'sks');

        return DataTables::eloquent($query)
            ->addIndexColumn()
            ->filterColumn('nim', fn ($q, $k) => $q->where('mahasiswa.nim', 'like', "%{$k}%"))
            ->filterColumn('nama_mahasiswa', fn ($q, $k) => $q->where('mahasiswa.nama', 'like', "%{$k}%"))
            ->filterColumn('tahun_akademik', fn ($q, $k) => $q->where('krs.tahun_akademik', 'like', "%{$k}%"))
            ->filterColumn('semester', fn ($q, $k) => $q->where('krs.semester', 'like', "%{$k}%"))
            ->orderColumn('nim', 'mahasiswa.nim $1')
            ->orderColumn('nama_mahasiswa', 'mahasiswa.nama $1')
            ->orderColumn('tahun_akademik', 'krs.tahun_akademik $1')
            ->orderColumn('semester', 'krs.semester $1')
            ->editColumn('total_sks', fn (Krs $krs) => (int) $krs->total_sks)
            ->addColumn('aksi', function (Krs $krs) {
                return view('krs._aksi', compact('krs'))->render();
            })
            ->rawColumns(['aksi'])
            ->toJson();
    }

    public function create(): View
    {
        // Isi awal tahun akademik & semester sesuai tanggal hari ini.
        $bulan = (int) date('n');
        $tahun = (int) date('Y');
        $awal  = $bulan >= 7 ? $tahun : $tahun - 1;

        $krs = new Krs([
            'tahun_akademik' => $awal . '/' . ($awal + 1),
            'semester'       => $bulan >= 7 ? 'Ganjil' : 'Genap',
        ]);

        return view('krs.create', $this->formData($krs));
    }

    public function store(Request $request): RedirectResponse
    {
        $data = $this->validated($request);

        $krs = DB::transaction(function () use ($data) {
            $krs = Krs::create([
                'mahasiswa_id'   => $data['mahasiswa_id'],
                'tahun_akademik' => $data['tahun_akademik'],
                'semester'       => $data['semester'],
            ]);
            $krs->mataKuliah()->sync($data['mata_kuliah_id']);

            return $krs;
        });

        return redirect()
            ->route('krs.index')
            ->with('success', 'KRS ' . $krs->mahasiswa->nama . ' berhasil dibuat.');
    }

    public function show(Krs $krs): View
    {
        $krs->load(['mahasiswa', 'mataKuliah' => fn ($q) => $q->orderBy('kode_mk')]);

        return view('krs.show', compact('krs'));
    }

    public function edit(Krs $krs): View
    {
        $terpilih = $krs->mataKuliah()->pluck('mata_kuliah.id')->all();

        return view('krs.edit', $this->formData($krs, $terpilih));
    }

    public function update(Request $request, Krs $krs): RedirectResponse
    {
        $data = $this->validated($request, $krs);

        DB::transaction(function () use ($krs, $data) {
            $krs->update([
                'mahasiswa_id'   => $data['mahasiswa_id'],
                'tahun_akademik' => $data['tahun_akademik'],
                'semester'       => $data['semester'],
            ]);
            $krs->mataKuliah()->sync($data['mata_kuliah_id']);
        });

        return redirect()
            ->route('krs.index')
            ->with('success', 'KRS ' . $krs->mahasiswa->nama . ' berhasil diperbarui.');
    }

    public function destroy(Krs $krs): JsonResponse
    {
        $nama = $krs->mahasiswa->nama;

        // krs_detail ikut terhapus (cascadeOnDelete di migrasi).
        $krs->delete();

        return response()->json(['message' => 'KRS ' . $nama . ' berhasil dihapus.']);
    }

    private function formData(Krs $krs, array $terpilih = []): array
    {
        return [
            'krs'        => $krs,
            'mahasiswa'  => Mahasiswa::orderBy('nama')->get(['id', 'nim', 'nama']),
            'mataKuliah' => MataKuliah::orderBy('kode_mk')->get(),
            'terpilih'   => $terpilih,
            'maksSks'    => Krs::MAKS_SKS,
        ];
    }

    /** Validasi bersama store & update. */
    private function validated(Request $request, ?Krs $krs = null): array
    {
        $data = $request->validate(
            [
                // Satu mahasiswa hanya boleh punya satu KRS per tahun akademik + semester
                // (sesuai indeks unik pada tabel krs).
                'mahasiswa_id' => ['required', 'integer', 'exists:mahasiswa,id',
                    Rule::unique('krs', 'mahasiswa_id')
                        ->where(fn ($q) => $q
                            ->where('tahun_akademik', $request->input('tahun_akademik'))
                            ->where('semester', $request->input('semester')))
                        ->ignore($krs?->id)],
                'tahun_akademik' => ['required', 'regex:/^\d{4}\/\d{4}$/',
                    function ($attribute, $value, $fail) {
                        [$a, $b] = explode('/', $value);
                        if ((int) $b !== (int) $a + 1) {
                            $fail('Tahun akademik harus berurutan, contoh 2026/2027.');
                        }
                    }],
                'semester' => ['required', Rule::in(['Ganjil', 'Genap'])],
                'mata_kuliah_id' => ['required', 'array', 'min:1'],
                'mata_kuliah_id.*' => ['integer', 'distinct', 'exists:mata_kuliah,id'],
            ],
            [
                'mahasiswa_id.required' => 'Mahasiswa wajib dipilih.',
                'mahasiswa_id.exists' => 'Mahasiswa tidak ditemukan.',
                'mahasiswa_id.unique' => 'Mahasiswa ini sudah memiliki KRS pada tahun akademik dan semester tersebut.',
                'tahun_akademik.required' => 'Tahun akademik wajib diisi.',
                'tahun_akademik.regex' => 'Format tahun akademik harus 2026/2027.',
                'semester.required' => 'Semester wajib dipilih.',
                'semester.in' => 'Semester harus Ganjil atau Genap.',
                'mata_kuliah_id.required' => 'Pilih minimal satu mata kuliah.',
                'mata_kuliah_id.min' => 'Pilih minimal satu mata kuliah.',
                'mata_kuliah_id.*.distinct' => 'Mata kuliah tidak boleh dipilih dua kali.',
                'mata_kuliah_id.*.exists' => 'Mata kuliah tidak ditemukan.',
            ]
        );

        // Fitur tambahan: validasi batas SKS
        $total = (int) MataKuliah::whereIn('id', $data['mata_kuliah_id'])->sum('sks');

        if ($total > Krs::MAKS_SKS) {
            throw ValidationException::withMessages([
                'mata_kuliah_id' => "Total SKS ({$total}) melebihi batas maksimal " . Krs::MAKS_SKS . ' SKS.',
            ]);
        }

        return $data;
    }
}
