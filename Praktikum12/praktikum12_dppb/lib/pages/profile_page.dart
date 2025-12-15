import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/page_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/caca.png'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Profil Pengguna',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'Nama : Salsabila Rahmadina',
                textAlign: TextAlign.center,
              ),
              const Text(
                'NIM : 707012400067',
                textAlign: TextAlign.center,
              ),
              const Text(
                'Prodi : D4 Sistem Informasi Kota Cerdas',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.home),
                label: const Text('Kembali ke Home'),
                onPressed: () {
                  context.read<PageCubit>().changePage(0);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
