import 'dart:io';

// Custom Exception untuk login error
class LoginException implements Exception {
  final String message;
  LoginException(this.message);

  @override
  String toString() => 'LoginException: $message';
}

void main() {
  // Username dan password contoh yang valid
  const String validUsername = 'user123';
  const String validPassword = 'pass123';

  print('--- Program Login Sederhana ---');

  try {
    // Input username
    stdout.write('Masukkan username: ');
    String? username = stdin.readLineSync();
    if (username == null || username.trim().isEmpty) {
      throw LoginException('Username tidak boleh kosong!');
    }

    // Input password
    stdout.write('Masukkan password: ');
    String? password = stdin.readLineSync();
    if (password == null || password.trim().isEmpty) {
      throw LoginException('Password tidak boleh kosong!');
    }

    // Validasi login
    if (username != validUsername || password != validPassword) {
      throw LoginException('Login Failed, Username/Password Salah');
    }

    // Jika login berhasil
    print('\nLogin berhasil! Selamat datang, $username.');

  } on LoginException catch (e) {
    // Menampilkan pesan error khusus login
    stderr.writeln('\n[e] $e');
  } catch (e) {
    // Menangani error lain yang tidak terduga
    stderr.writeln('\n[ERROR UMUM] Terjadi kesalahan: $e');
  } finally {
    print('\nProgram selesai dijalankan.');
  }
}