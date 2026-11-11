@props(['kolom' => [], 'baris' => []])

<div class="table-responsive">
    <table class="table table-striped table-hover align-middle mb-0">
        <thead>
            <tr>
                <th scope="col" class="bg-body-tertiary" style="width: 50px">#</th>
                @foreach ($kolom as $judul)
                    <th scope="col" class="bg-body-tertiary">{{ $judul }}</th>
                @endforeach
            </tr>
        </thead>
        <tbody>
            @forelse ($baris as $item)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    @foreach ($kolom as $kunci => $judul)
                        <td>
                            @if ($kunci === 'status')
                                @php
                                    $warna = match (strtolower($item[$kunci])) {
                                        'aktif', 'disetujui' => 'success',
                                        'menunggu', 'cuti', 'diajukan' => 'warning',
                                        'ditolak' => 'danger',
                                        default => 'secondary',
                                    };
                                @endphp
                                <span class="badge text-bg-{{ $warna }}">
                                    {{ ucfirst($item[$kunci]) }}
                                </span>
                            @elseif ($kunci === 'nim')
                                <a href="{{ route('mahasiswa.show', $item[$kunci]) }}"
                                   class="text-decoration-none">
                                    {{ $item[$kunci] }}
                                </a>
                            @else
                                {{ $item[$kunci] }}
                            @endif
                        </td>
                    @endforeach
                </tr>
            @empty
                <tr>
                    <td colspan="{{ count($kolom) + 1 }}"
                        class="text-center text-body-secondary py-4">
                        Belum ada data.
                    </td>
                </tr>
            @endforelse
        </tbody>
    </table>
</div>
