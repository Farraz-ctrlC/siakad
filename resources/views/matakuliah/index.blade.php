@extends('layouts.app')

@section('title', 'Data Mata Kuliah')

@section('content')
    <x-page-header judul="Data Mata Kuliah"
                   deskripsi="Pencarian dan pengurutan diproses di server." />

    <div class="card border-0 shadow-sm">
        <div class="card-header bg-body d-flex justify-content-between align-items-center">
            <span class="fw-semibold">Daftar Mata Kuliah</span>
            @if (Auth::user()->role === 'admin')
                <a href="{{ route('matakuliah.create') }}" class="btn btn-primary btn-sm">
                    <i class="bi bi-plus-lg"></i> Tambah Mata Kuliah
                </a>
            @endif
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table id="tabel-matakuliah"
                       class="table table-striped table-hover align-middle w-100">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Kode</th>
                            <th>Mata Kuliah</th>
                            <th>SKS</th>
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
            $('#tabel-matakuliah').DataTable({
                processing: true,
                serverSide: true,
                ajax: @json(route('matakuliah.data', [], false)),
                columns: [
                    { data: 'DT_RowIndex', name: 'DT_RowIndex',
                      orderable: false, searchable: false },
                    { data: 'kode_mk', name: 'kode_mk' },
                    { data: 'nama_mk', name: 'nama_mk' },
                    { data: 'sks', name: 'sks' },
                    { data: 'aksi', name: 'aksi', className: 'text-nowrap',
                      orderable: false, searchable: false },
                ],
                order: [[1, 'asc']],
                language: DT_ID,
            });
        });
    </script>
@endpush

@include('layouts.partials.hapus', ['tabel' => '#tabel-matakuliah', 'jenis' => 'mata kuliah'])
