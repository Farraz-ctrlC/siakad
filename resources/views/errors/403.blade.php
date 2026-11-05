@extends('layouts.app')

@section('title', '403 Forbidden')

@section('content')
<div class="d-flex align-items-center justify-content-center min-vh-75 py-5">
    <div class="text-center">
        <h1 class="display-1 fw-bold text-danger">403</h1>
        <h2 class="h3 fw-semibold mb-3">Akses Ditolak (Forbidden)</h2>
        <p class="text-body-secondary mb-4">
            Anda tidak memiliki hak akses untuk membuka halaman ini.
        </p>
        <a href="{{ route('dashboard') }}" class="btn btn-primary px-4">
            <i class="bi bi-house-door-fill me-1"></i> Kembali ke Dashboard
        </a>
    </div>
</div>
@endsection