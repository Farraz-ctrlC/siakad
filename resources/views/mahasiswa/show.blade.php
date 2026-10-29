@extends('layouts.app')

@section('title', 'Detail Mahasiswa')

@section('content')
    <x-page-header judul="Detail Mahasiswa"
                   deskripsi="Informasi lengkap satu mahasiswa (data contoh).">
        <a href="{{ route('mahasiswa.index') }}" class="btn btn-outline-secondary">
            <i class="bi bi-arrow-left"></i> Kembali
        </a>
    </x-page-header>

    <div class="card border-0 shadow-sm">
        <div class="card-header bg-body fw-semibold">{{ $mhs['nama'] }}</div>
        <div class="card-body">
            <dl class="row mb-0">
                <dt class="col-sm-3">NIM</dt>
                <dd class="col-sm-9">{{ $mhs['nim'] }}</dd>

                <dt class="col-sm-3">Nama Lengkap</dt>
                <dd class="col-sm-9">{{ $mhs['nama'] }}</dd>

                <dt class="col-sm-3">Angkatan</dt>
                <dd class="col-sm-9">{{ $mhs['angkatan'] }}</dd>

                <dt class="col-sm-3">Email</dt>
                <dd class="col-sm-9">{{ $mhs['email'] }}</dd>

                <dt class="col-sm-3">Status</dt>
                <dd class="col-sm-9">
                    <span class="badge text-bg-secondary">{{ $mhs['status'] }}</span>
                </dd>
            </dl>
        </div>
    </div>
@endsection