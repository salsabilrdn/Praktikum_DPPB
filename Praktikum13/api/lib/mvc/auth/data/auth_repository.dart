import 'package:dio/dio.dart';

import '../../../../core/dio_client.dart';
import 'user_model.dart';

class AuthRepository {
  AuthRepository(this._client);
  final DioClient _client;

  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    final response = await _client.post<Map<String, dynamic>>(
      '/register',
      data: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
    );

    final data = response.data ?? {};
    return {
      'user': UserModel.fromJson(data['user'] as Map<String, dynamic>),
      'token': data['access_token'] as String,
      'message': data['message'] as String? ?? 'Registration successful',
    };
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.post<Map<String, dynamic>>(
        '/login',
        data: {'email': email, 'password': password},
      );

      final data = response.data ?? {};
      return {
        'user': UserModel.fromJson(data['user'] as Map<String, dynamic>),
        'token': data['access_token'] as String,
        'message': data['message'] as String? ?? 'Login berhasil',
      };
    } on DioError catch (e) {
      // Connection errors - no internet or server unreachable
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.unknown) {
        throw Exception('Cek koneksi internet anda');
      }
      // Normalize invalid credentials
      final status = e.response?.statusCode;
      final msg = e.response?.data is Map ? e.response?.data['message'] : null;
      if (status == 401 ||
          (msg is String && msg.toLowerCase().contains('invalid'))) {
        throw Exception('Email atau password salah');
      }
      // Validation errors
      if (status == 422) {
        throw Exception('Input tidak valid. Periksa email dan password.');
      }
      throw Exception(msg ?? 'Gagal login. Coba lagi.');
    }
  }

  Future<String> logout() async {
    final response = await _client.post<Map<String, dynamic>>('/logout');
    final data = response.data ?? {};
    return data['message'] as String? ?? 'Logout successful';
  }

  Future<UserModel> getProfile() async {
    final response = await _client.get<Map<String, dynamic>>('/me');
    final data = response.data ?? {};
    return UserModel.fromJson(data['user'] as Map<String, dynamic>);
  }
}
