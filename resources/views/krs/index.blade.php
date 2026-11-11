@extends('layouts.app')

@section('title', 'Data KRS')

@section('content')
    <x-page-header judul="Data KRS"
                   deskripsi="Kartu Rencana Studi mahasiswa beserta mata kuliah yang diambil." />

    <div class="card border-0 shadow-sm">
        <div class="card-header bg-body d-flex justify-content-between align-items-center">
            <span class="fw-semibold">Daftar KRS</span>
            @if (Auth::user()->role === 'admin')
                <a href="{{ route('krs.create') }}" class="btn btn-primary btn-sm">
                    <i class="bi bi-plus-lg"></i> Buat KRS
                </a>
            @endif
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table id="tabel-krs"
                       class="table table-striped table-hover align-middle w-100">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>NIM</th>
                            <th>Nama Mahasiswa</th>
                            <th>Tahun Akademik</th>
                            <th>Semester</th>
                            <th>Total SKS</th>
                            <th>Jml MK</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
@endsection

@push('styles')
    <link href="{{ asset('vendor/datatables/dataTables.bootstrap5.min.css') }}" rel="stylesheet">
@endpush

@push('scripts')
    <script src="{{ asset('vendor/jquery/jquery-3.7.1.min.js') }}"></script>
    <script src="{{ asset('vendor/datatables/dataTables.min.js') }}"></script>
    <script src="{{ asset('vendor/datatables/dataTables.bootstrap5.min.js') }}"></script>
    <script src="{{ asset('js/datatables-id.js') }}"></script>
    <script>
        $(function () {
            $('#tabel-krs').DataTable({
                processing: true,
                serverSide: true,
                ajax: @json(route('krs.data', [], false)),
                columns: [
                    { data: 'DT_RowIndex', name: 'DT_RowIndex',
                      orderable: false, searchable: false },
                    { data: 'nim', name: 'nim' },
                    { data: 'nama_mahasiswa', name: 'nama_mahasiswa' },
                    { data: 'tahun_akademik', name: 'tahun_akademik' },
                    { data: 'semester', name: 'semester' },
                    { data: 'total_sks', name: 'total_sks', searchable: false },
                    { data: 'jumlah_mk', name: 'jumlah_mk', searchable: false },
                    { data: 'aksi', name: 'aksi', className: 'text-nowrap',
                      orderable: false, searchable: false },
                ],
                order: [[3, 'desc']],
                language: DT_ID,
            });
        });
    </script>
@endpush

@include('layouts.partials.hapus', ['tabel' => '#tabel-krs', 'jenis' => 'KRS'])
