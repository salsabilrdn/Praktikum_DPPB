import 'package:flutter/material.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Selamat Datang di Home Page',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A2647), // Navy
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'Demonstrasi Navigasi Flutter:',
            style: TextStyle(fontSize: 15, color: Colors.black54),
          ),

          const SizedBox(height: 20),

          // Tombol ke Profil
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            icon: const Icon(Icons.person),
            label: const Text('Buka Halaman Profil'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF144272),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 15),

          // Tombol ke Pengaturan
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            icon: const Icon(Icons.settings),
            label: const Text('Buka Pengaturan'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF205295),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
