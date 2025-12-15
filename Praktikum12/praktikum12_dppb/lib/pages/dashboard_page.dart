import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/page_cubit.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'settings_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, index) {
        Widget page;

        switch (index) {
          case 1:
            page = const ProfilePage();
            break;
          case 2:
            page = const SettingsPage();
            break;
          default:
            page = const HomePage();
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Aplikasi Navigasi'),
          ),
          body: page,

       
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            selectedItemColor: const Color(0xFF0A1E3F), // biru navy
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            onTap: (value) {
              context.read<PageCubit>().changePage(value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
