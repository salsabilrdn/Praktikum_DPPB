import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/page_cubit.dart';
import '../cubit/post_cubit.dart';
import '../cubit/post_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch posts when HomePage is loaded
    context.read<PostCubit>().fetchPosts();

    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        return Center(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.home,
                    size: 100,
                    color: Color(0xFF0A1E3F), // biru navy
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Selamat Datang 👋',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Aplikasi ini merupakan contoh penerapan\n'
                    'State Management (Cubit), Bottom Navigation,\n'
                    'SnackBar, AlertDialog, dan REST API.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  // Display posts count
                  if (state is PostLoading)
                    const CircularProgressIndicator()
                  else if (state is PostLoaded)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.article,
                              size: 40,
                              color: Color(0xFF0A1E3F),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${state.posts.length} Posts',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text('dari JSONPlaceholder API'),
                          ],
                        ),
                      ),
                    )
                  else if (state is PostError)
                    Text(
                      'Error: ${state.message}',
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),

                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.person),
                    label: const Text('Menuju Profil'),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Menuju halaman Profil...'),
                        ),
                      );
                      context.read<PageCubit>().changePage(1);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
