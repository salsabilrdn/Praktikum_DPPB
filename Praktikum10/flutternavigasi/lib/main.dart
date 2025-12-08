import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Praktikum Navigasi',
      // 🔵 THEME NAVY (ganti teal ke navy)
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF0A2647), // NAVY
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/profile': (context) => const ProfilePage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}

// 🔵 LAYOUT TAB BAR NAVY
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Aplikasi Navigasi Flutter'),
          backgroundColor: const Color(0xFF0A2647), // NAVY dark
          foregroundColor: Colors.white,

          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Color(0xFF7EA6D4), // biru muda
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.person), text: 'Profil'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
            ],
          ),
        ),

        body: const TabBarView(
          children: [
            HomePageContent(),
            ProfilePage(),
            SettingsPage(),
          ],
        ),
      ),
    );
  }
}
