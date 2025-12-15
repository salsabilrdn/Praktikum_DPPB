import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/page_cubit.dart';
import 'pages/dashboard_page.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => PageCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // 🎨 THEME BIRU NAVY
      theme: ThemeData(
        primaryColor: const Color(0xFF0A1E3F),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A1E3F),
          foregroundColor: Colors.white,
        ),
      ),

      // 🧭 ROUTE UTAMA
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardPage(),
      },
    );
  }
}
