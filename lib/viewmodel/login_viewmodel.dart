import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/api_urls.dart';
import '../models/login_model.dart';
import '../service/api_repo.dart';

class LoginViewModel extends StateNotifier<AsyncValue<AuthModel?>> {
  final ApiRepo apiRepo;

  LoginViewModel(this.apiRepo) : super(const AsyncValue.data(null));

  Future<void> signIn(
      String username,
      String password,
      int selectedIndex,
      BuildContext context,
      ) async {
    state = const AsyncValue.loading();

    try {
      final response = await apiRepo.postRequestHTTP(
        context,
        ApiUrl.login,
        data: {
          'j_username': username.trim(),
          'j_password': password.trim(),
        },
      );

      if (response != null && response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final auth = AuthModel.fromJson(json);

        final role = auth.user?.role;
        if ((selectedIndex == 0 && role == 'user') ||
            (selectedIndex == 1 && role == 'editor')) {
          state = AsyncValue.data(auth);
        } else {
          final error = 'Unsupported role: $role';
          apiRepo.showToast(message: error, context: context);
          state = AsyncValue.error(error, StackTrace.current);
        }
      } else {
        apiRepo.handleError(response, context);
        state = AsyncValue.error('Login failed', StackTrace.current);
      }
    } catch (e, st) {
      apiRepo.showToast(message: e.toString(), context: context);
      state = AsyncValue.error(e, st);
    }
  }

}
