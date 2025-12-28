import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app_router.dart';
import 'core/dio_client.dart';
import 'mvc/auth/bloc/auth_bloc.dart';
import 'mvc/auth/data/auth_repository.dart';
import 'mvc/auth/data/auth_storage.dart';
import 'mvc/auth/view/login_page.dart';
import 'mvc/auth/view/register_page.dart';
import 'mvc/posts/bloc/post_bloc.dart';
import 'mvc/posts/data/post_repository.dart';
import 'mvc/posts/views/post_form_page.dart';
import 'mvc/posts/views/post_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure HttpClient untuk image loading dengan timeout lebih lama
  HttpOverrides.global = _CustomHttpOverrides();

  const baseUrl = 'http://192.168.18.33:8000/api'; // IP laptop di WiFi

  final authStorage = AuthStorage();
  final token = await authStorage.getToken();

  final dioClient = DioClient(baseUrl: baseUrl, token: token);
  final authRepository = AuthRepository(dioClient);
  final postRepository = PostRepository(dioClient);

  final appRouter = AppRouter(
    authRepository: authRepository,
    authStorage: authStorage,
    postRepository: postRepository,
  );

  runApp(
    MyApp(
      appRouter: appRouter,
      authRepository: authRepository,
      authStorage: authStorage,
      postRepository: postRepository,
      dioClient: dioClient,
      initialToken: token,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.appRouter,
    required this.authRepository,
    required this.authStorage,
    required this.postRepository,
    required this.dioClient,
    this.initialToken,
  });

  final AppRouter appRouter;
  final AuthRepository authRepository;
  final AuthStorage authStorage;
  final PostRepository postRepository;
  final DioClient dioClient;
  final String? initialToken;

  static final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authRepository),
        RepositoryProvider.value(value: authStorage),
        RepositoryProvider.value(value: postRepository),
        RepositoryProvider.value(value: dioClient),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(
              authRepository: authRepository,
              authStorage: authStorage,
            )..add(const AuthCheckRequested()),
          ), // AuthBloc
          BlocProvider(create: (_) => PostBloc(postRepository)),
        ],
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.status == AuthStatus.authenticated) {
              // Update token di DioClient setiap kali authenticated
              authStorage.getToken().then((token) {
                if (token != null) {
                  dioClient.updateToken(token);
                }
              });
              // Tampilkan snackbar sukses login secara global
              final successMsg = state.message ?? 'Login berhasil';
              _scaffoldMessengerKey.currentState?.removeCurrentSnackBar();
              _scaffoldMessengerKey.currentState?.showSnackBar(
                SnackBar(
                  content: Text(successMsg),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.green[600],
                ), // SnackBar
              );
              // Pastikan langsung mengalihkan ke halaman posts
              Future.delayed(const Duration(milliseconds: 200), () {
                if (context.mounted) {
                  try {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/posts',
                      (Route<dynamic> route) => false,
                    );
                  } catch (e) {
                    print('Navigator error: \$e');
                  }
                }
              }); // Future.delayed
            } else if (state.status == AuthStatus.unauthenticated) {
              dioClient.clearToken();
              // Tampilkan snackbar jika ada pesan
              if (state.message != null && state.message!.isNotEmpty) {
                final msg = state.message!;
                final isLogoutMessage = msg.contains('Logout');
                _scaffoldMessengerKey.currentState?.removeCurrentSnackBar();
                _scaffoldMessengerKey.currentState?.showSnackBar(
                  SnackBar(
                    content: Text(msg),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: isLogoutMessage
                        ? Colors.green[600]
                        : Colors.red[700],
                  ), // SnackBar
                );
              }
              // Kembali ke halaman login setelah logout
              Future.microtask(() {
                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
              }); // Future.microtask
            }
          },
          child: MaterialApp(
            title: 'Flutter Laravel API',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
              useMaterial3: true,
            ), // ThemeData
            scaffoldMessengerKey: _scaffoldMessengerKey,
            initialRoute: '/',
            routes: {
              '/': (context) => BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  // Loading or checking auth on app start
                  if (state.status == AuthStatus.loading ||
                      state.status == AuthStatus.initial) {
                    return const Scaffold(
                      body: Center(child: CircularProgressIndicator()),
                    ); // Scaffold
                  }
                  // Authenticated - show posts page
                  else if (state.status == AuthStatus.authenticated) {
                    return BlocProvider.value(
                      value: context.read<PostBloc>()..add(const PostFetched()),
                      child: const PostPage(),
                    ); // BlocProvider.value
                  }
                  // Unauthenticated - show login page
                  else {
                    return const LoginPage();
                  }
                },
              ), // BlocBuilder
              '/login': (context) => const LoginPage(),
              '/register': (context) => const RegisterPage(),
              '/posts': (context) => const PostPage(),
              '/post-form': (context) => const PostFormPage(),
            },
          ), // MaterialApp
        ), // BlocListener
      ), // MultiBlocProvider
    ); // MultiRepositoryProvider
  }
}

class _CustomHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..connectionTimeout = const Duration(seconds: 30)
      ..findProxy = HttpClient.findProxyFromEnvironment;
  }
}
