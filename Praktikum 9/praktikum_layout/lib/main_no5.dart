import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Praktikum No 5',
      theme: ThemeData(
          primarySwatch: Colors.blue, // Mengganti warna utama
          ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Index halaman yang sedang aktif

  // Daftar 3 Halaman (Layout)
  // Di sini kita mendefinisikan isi dari Home, Profile, dan Settings
  static const List<Widget> _pages = <Widget>[
    // 1. Halaman Utama (HomePage)
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 100, color: Colors.blue),
          SizedBox(height: 20),
          Text(
            'Halaman Utama (HomePage)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
    // 2. Halaman Profil (ProfilePage)
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 100, color: Colors.green),
          SizedBox(height: 20),
          Text(
            'Halaman Profil (ProfilePage)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text('Nama: Salsabila Rahmadina'),
          Text('NIM: 707012400067'),
        ],
      ),
    ),
    // 3. Halaman Pengaturan (SettingsPage)
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 100, color: Colors.grey),
          SizedBox(height: 20),
          Text(
            'Halaman Pengaturan (SettingsPage)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  ];

  // Fungsi untuk mengubah index saat tombol navigasi ditekan
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi 3 Layout'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _pages[_selectedIndex], // Menampilkan halaman yang dipilih

      // NAVIGASI BAWAH
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex, // Index halaman saat ini
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped, // Memanggil fungsi saat ditekan
      ),
    );
  }
}