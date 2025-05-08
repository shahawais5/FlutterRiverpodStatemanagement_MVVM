import 'package:dio/dio.dart';
import '../constants/api_urls.dart';
import '../models/login_model.dart';

class AuthService {
  final Dio _dio = Dio();

  Future<AuthModel> login(String email, String password) async {
    try {
      final response = await _dio.post(
        ApiUrl.login,
        data: {
          'j_username': email.trim(),
          'j_password': password.trim(),
        },
      );

      if ((response.statusCode == 200 || response.statusCode == 201) &&
          response.data['status'] == 'connected') {
        return AuthModel.fromJson(response.data);
      } else {
        throw Exception(response.data['message'] ?? 'Login failed');
      }
    } catch (e) {
      rethrow;
    }
  }
}
