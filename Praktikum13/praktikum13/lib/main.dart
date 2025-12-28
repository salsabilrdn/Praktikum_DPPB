import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/page_cubit.dart';
import 'cubit/user_cubit.dart';
import 'cubit/post_cubit.dart';
import 'services/api_service.dart';
import 'pages/dashboard_page.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PageCubit()),
        BlocProvider(create: (_) => UserCubit(ApiService())),
        BlocProvider(create: (_) => PostCubit(ApiService())),
      ],
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
      title: 'Praktikum 13 - REST API',

      // 🎨 THEME BIRU NAVY
      theme: ThemeData(
        primaryColor: const Color(0xFF0A1E3F),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A1E3F),
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0A1E3F),
            foregroundColor: Colors.white,
          ),
        ),
      ),

      // 🧭 ROUTE UTAMA
      initialRoute: '/',
      routes: {'/': (context) => const DashboardPage()},
    );
  }
}
