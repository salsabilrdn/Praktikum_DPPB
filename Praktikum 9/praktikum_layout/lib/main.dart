import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // --- SOAL 2: DEFINISI FUNGSI Button Column ---
  // Fungsi ini membangun satu kolom yang berisi Ikon dan Teks
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
  // ---------------------------------------------

  @override
  Widget build(BuildContext context) {
    // --- IMPLEMENTASI TITLE SECTION (SOAL 1) ---
    // Diubah menjadi 'Wisata Gunung Bromo' agar konsisten dengan deskripsi
    Widget titleSection = Container(
      padding: const EdgeInsets.all(
        32,
      ), // Padding 32 piksel untuk seluruh baris
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Wisata Gunung Bromo', // Judul diubah
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  'Batu, Malang, Indonesia',
                  style: TextStyle(
                    color: Colors.grey, // Warna abu-abu
                  ),
                ),
              ],
            ),
          ), // Expanded

          Icon(Icons.star, color: Colors.red[500]),
          const Text('41'),
        ],
      ), // Row
    ); // Container

    // --- IMPLEMENTASI BUTTON SECTION (SOAL 2) ---
    Color color = Theme.of(context).primaryColor; 

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Jarak antar tombol merata
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    ); // Row
    // ------------------------------------------

    // --- IMPLEMENTASI TEXTSECTION (SOAL 3) ---
    // Diubah menjadi deskripsi Bromo dan identitas Salsabila
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Gunung Bromo atau dalam bahasa Tengger dieja "Brama", juga disebut Kaldera Tengger, '
        'adalah sebuah gunung berapi aktif di Jawa Timur, Indonesia. Gunung ini memiliki ketinggian '
        '2.614 meter di atas permukaan laut dan berada dalam empat wilayah kabupaten, yakni Kabupaten '
        'Probolinggo, Kabupaten Pasuruan, Kabupaten Lumajang, dan Kabupaten Malang. '
        'Gunung Bromo terkenal sebagai objek wisata utama di Jawa Timur.\n\n'
        
        // Identitas baru
        'Nama: Salsabila Rahmadina\n'
        'NIM: 7712400067',
        softWrap: true,
      ),
    ); 
    // ------------------------------------------
    
    return MaterialApp(
      // Judul aplikasi diubah ke identitas Salsabila
      title: 'Flutter Layout: Salsabila Rahmadina - 7712400067',
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter layout demo')),
        // Mengubah Column menjadi ListView untuk memungkinkan scrolling
        // Gambar ditambahkan sebagai elemen pertama di ListView
        body: ListView( 
          children: [
            // Gambar akan ditampilkan di sini
            Image.asset(
              'assets/images/BROMO.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ), // Image.asset
            titleSection,
            buttonSection, 
            textSection, 
          ],
        ), // ListView
      ), // Scaffold
    ); // MaterialApp
  }
}
