import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Toko')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Nama Toko:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Toko Online Flutter'),
            SizedBox(height: 16),
            Text('Pengembang:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Nama Mahasiswa'),
            SizedBox(height: 16),
            Text('Deskripsi:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              'Aplikasi ini merupakan toko online yang '
              'dibuat menggunakan Flutter dengan penerapan state management '
              'BLoC/Cubit, AlertDialog, SnackBar, dan Router (named route).',
            ),
            SizedBox(height: 24),
            Text('Kontak:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Email: mahasiswa@telkomuniversity.ac.id'),
          ],
        ),
      ),
    );
  }
}
