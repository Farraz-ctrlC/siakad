@php
    $dipilih = collect(old('mata_kuliah_id', $terpilih))->map(fn ($v) => (int) $v)->all();
@endphp

<div class="row g-3 mb-4">
    <div class="col-md-6">
        <label for="mahasiswa_id" class="form-label">Mahasiswa</label>
        <select id="mahasiswa_id" name="mahasiswa_id"
                @class(['form-select', 'is-invalid' => $errors->has('mahasiswa_id')]) required>
            <option value="">-- Pilih mahasiswa --</option>
            @foreach ($mahasiswa as $m)
                <option value="{{ $m->id }}"
                    @selected((int) old('mahasiswa_id', $krs->mahasiswa_id) === $m->id)>
                    {{ $m->nim }} - {{ $m->nama }}
                </option>
            @endforeach
        </select>
        @error('mahasiswa_id')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>
    <div class="col-md-3">
        <x-form-input label="Tahun Akademik" name="tahun_akademik"
                      :value="$krs->tahun_akademik" placeholder="2026/2027"
                      maxlength="9" required />
    </div>
    <div class="col-md-3">
        <label for="semester" class="form-label">Semester</label>
        <select id="semester" name="semester"
                @class(['form-select', 'is-invalid' => $errors->has('semester')]) required>
            <option value="Ganjil" @selected(old('semester', $krs->semester) === 'Ganjil')>Ganjil</option>
            <option value="Genap" @selected(old('semester', $krs->semester) === 'Genap')>Genap</option>
        </select>
        @error('semester')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>
</div>

<div class="d-flex justify-content-between align-items-center mb-2">
    <h2 class="h6 mb-0">Pilih Mata Kuliah</h2>
    <span class="badge text-bg-primary fs-6">
        Total SKS: <span id="total-sks">0</span> / {{ $maksSks }}
    </span>
</div>

@error('mata_kuliah_id')
    <div class="alert alert-danger py-2">{{ $message }}</div>
@enderror
@error('mata_kuliah_id.*')
    <div class="alert alert-danger py-2">{{ $message }}</div>
@enderror

<div class="table-responsive border rounded mb-3">
    <table class="table table-sm table-hover align-middle mb-0">
        <thead>
            <tr>
                <th style="width: 50px"></th>
                <th>Kode</th>
                <th>Mata Kuliah</th>
                <th>SKS</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($mataKuliah as $mk)
                <tr>
                    <td>
                        <input type="checkbox" class="form-check-input cek-mk"
                               id="mk-{{ $mk->id }}" name="mata_kuliah_id[]"
                               value="{{ $mk->id }}" data-sks="{{ $mk->sks }}"
                               @checked(in_array($mk->id, $dipilih, true))>
                    </td>
                    <td><label for="mk-{{ $mk->id }}">{{ $mk->kode_mk }}</label></td>
                    <td>{{ $mk->nama_mk }}</td>
                    <td>{{ $mk->sks }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</div>

@push('scripts')
    <script>
        (function () {
            const maks = {{ $maksSks }};
            const boxes = document.querySelectorAll('.cek-mk');
            const out = document.getElementById('total-sks');

            function hitung() {
                let total = 0;
                boxes.forEach(function (b) {
                    if (b.checked) { total += parseInt(b.dataset.sks, 10); }
                });
                out.textContent = total;
                out.parentElement.className =
                    'badge fs-6 ' + (total > maks ? 'text-bg-danger' : 'text-bg-primary');
            }

            boxes.forEach(function (b) { b.addEventListener('change', hitung); });
            hitung();
        })();
    </script>
@endpush
