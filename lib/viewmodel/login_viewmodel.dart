import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/login_model.dart';
import '../service/auth_service.dart';

class LoginViewModel extends StateNotifier<AsyncValue<AuthModel?>> {
  final AuthService _authService;

  LoginViewModel(this._authService) : super(const AsyncValue.data(null));

  Future<void> signIn(String username, String password, int selectedIndex, BuildContext context) async {
    state = const AsyncValue.loading();
    try {
      final auth = await _authService.login(username, password);

      if (auth != null) {
        final role = auth.user?.role;
        if ((selectedIndex == 0 && role == 'user') ||
            (selectedIndex == 1 && role == 'editor')) {
          state = AsyncValue.data(auth);
        } else {
          state = AsyncValue.error('Unsupported role: $role', StackTrace.current);
        }
      } else {
        state = AsyncValue.error('Login failed', StackTrace.current);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
