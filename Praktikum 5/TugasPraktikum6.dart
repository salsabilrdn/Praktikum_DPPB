import 'dart:io';

// Custom Exception 1: Untuk data kosong
class InputKosongException implements Exception {
    final String message;
    InputKosongException(this.message);

    @override
    String toString() => 'InputKosongException: $message';
}

// Custom Exception 2: Untuk input bukan angka
class AngkaTidakValidException implements Exception {
    final String message;
    AngkaTidakValidException(this.message);

    @override
    String toString() => 'AngkaTidakValidException: $message';
}


void main() {
    String judul = '';
    int tahun = 0;
    int durasi = 0;

    print('--- Program Pengelola Data Film ---');

    try {
        // --- Input Judul Film ---
        stdout.write('Masukkan judul film: ');
        String? judulInput = stdin.readLineSync();
        if (judulInput == null || judulInput.trim().isEmpty) {
            throw InputKosongException('Judul film tidak boleh kosong!');
        }
        judul = judulInput.trim();

        // --- Input Tahun Rilis ---
        stdout.write('Masukkan tahun rilis: ');
        String? tahunStr = stdin.readLineSync();
        if (tahunStr == null || tahunStr.trim().isEmpty) {
             throw InputKosongException('Tahun rilis tidak boleh kosong!');
        }
        
        try {
            // Konversi string ke int. parse() akan melempar FormatException jika gagal.
            tahun = int.parse(tahunStr.trim()); 
            // Tambahan: Contoh validasi angka
            if (tahun < 1900 || tahun > 2100) {
                 throw AngkaTidakValidException('Tahun rilis tidak valid (contoh: 1900-2100).');
            }
        } on FormatException {
            // Menangkap FormatException bawaan Dart dan menggantinya dengan custom exception
            throw AngkaTidakValidException('Tahun rilis harus berupa angka!');
        }


        // --- Input Durasi Film ---
        stdout.write('Masukkan durasi film (menit): ');
        String? durasiStr = stdin.readLineSync();
        if (durasiStr == null || durasiStr.trim().isEmpty) {
             throw InputKosongException('Durasi film tidak boleh kosong!');
        }
        
        try {
            durasi = int.parse(durasiStr.trim());
            // Tambahan: Contoh validasi angka
             if (durasi <= 0) {
                 throw AngkaTidakValidException('Durasi film harus lebih dari 0 menit.');
            }
        } on FormatException {
            throw AngkaTidakValidException('Durasi film harus berupa angka!');
        }

        // --- Tampilkan Hasil (Jika input sukses) ---
        print('\n--- Data Film Berhasil Disimpan ---');
        print('Judul  : $judul');
        print('Tahun  : $tahun');
        print('Durasi : $durasi menit');

    // Minimal tiga jenis catch/on yang berbeda:
    } on InputKosongException catch (e) {
        // 1. Menangani custom exception: Input Kosong
        stderr.writeln('\n[ERROR INPUT KOSONG] ${e.message}');
    } on AngkaTidakValidException catch (e) {
        // 2. Menangani custom exception: Angka Tidak Valid (termasuk validasi FormatException)
        stderr.writeln('\n[ERROR ANGKA TIDAK VALID] ${e.message}');
    } on Exception catch (e) {
        // 3. Menangani semua exception lain yang tidak terduga
        stderr.writeln('\n[ERROR UMUM] Terjadi kesalahan tak terduga: $e');
    } finally {
        // Blok finally wajib ada dan selalu dieksekusi
        print('\nProgram selesai dijalankan.');
    }
}