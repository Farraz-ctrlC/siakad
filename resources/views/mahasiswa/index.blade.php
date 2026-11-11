@extends('layouts.app')

@section('title', 'Data Mahasiswa')

@section('content')
    <x-page-header judul="Data Mahasiswa"
                   deskripsi="Pencarian dan pengurutan diproses di server." />

    <div class="card border-0 shadow-sm">
        <div class="card-header bg-body d-flex justify-content-between align-items-center">
            <span class="fw-semibold">Daftar Mahasiswa</span>
            @if (Auth::user()->role === 'admin')
                <a href="{{ route('mahasiswa.create') }}" class="btn btn-primary btn-sm">
                    <i class="bi bi-plus-lg"></i> Tambah Mahasiswa
                </a>
            @endif
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table id="tabel-mahasiswa"
                       class="table table-striped table-hover align-middle w-100">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>NIM</th>
                            <th>Nama</th>
                            <th>Jenis Kelamin</th>
                            <th>Email</th>
                            <th>Angkatan</th>
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
            $('#tabel-mahasiswa').DataTable({
                processing: true,
                serverSide: true,
                ajax: @json(route('mahasiswa.data', [], false)),
                columns: [
                    { data: 'DT_RowIndex', name: 'DT_RowIndex',
                      orderable: false, searchable: false },
                    { data: 'nim', name: 'nim' },
                    { data: 'nama', name: 'nama' },
                    { data: 'jenis_kelamin', name: 'jenis_kelamin' },
                    { data: 'email', name: 'email' },
                    { data: 'angkatan', name: 'angkatan' },
                    { data: 'aksi', name: 'aksi', className: 'text-nowrap',
                      orderable: false, searchable: false },
                ],
                order: [[2, 'asc']],
                language: DT_ID,
            });
        });
    </script>
@endpush

@include('layouts.partials.hapus', ['tabel' => '#tabel-mahasiswa', 'jenis' => 'mahasiswa'])
