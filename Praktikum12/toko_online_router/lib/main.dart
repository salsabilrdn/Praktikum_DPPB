import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chart/cart_cubit.dart'; // Pastikan nama folder sesuai (chart/cart)
import 'pages/home_page.dart';
import 'pages/cart_page.dart';
import 'pages/about_page.dart';

void main() {
  // BlocProvider diletakkan di root agar CartCubit bisa diakses di seluruh aplikasi
  runApp(BlocProvider(create: (_) => CartCubit(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Online Sederhana',
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      initialRoute: '/', // Rute awal aplikasi
      routes: {
        '/': (context) => const HomePage(),       // Halaman Utama
        '/cart': (context) => const CartPage(),   // Halaman Keranjang
        '/about': (context) => const AboutPage(), // Halaman Tentang
      },
    );
  }
}