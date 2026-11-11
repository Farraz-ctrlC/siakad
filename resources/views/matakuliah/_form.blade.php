<div class="row g-3">
    <div class="col-md-3">
        <x-form-input label="Kode MK" name="kode_mk" :value="$mataKuliah->kode_mk"
                      maxlength="10" required autofocus />
    </div>
    <div class="col-md-7">
        <x-form-input label="Nama Mata Kuliah" name="nama_mk"
                      :value="$mataKuliah->nama_mk" maxlength="100" required />
    </div>
    <div class="col-md-2">
        <x-form-input label="SKS" name="sks" type="number"
                      :value="$mataKuliah->sks" min="1" max="6" required />
    </div>
</div>
<div class="mt-3"></div>
