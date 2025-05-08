import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/login_model.dart';
import '../service/auth_service.dart';
import '../viewmodel/login_viewmodel.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

final loginProvider = StateNotifierProvider<LoginViewModel, AsyncValue<AuthModel?>>((ref) {
  final service = ref.watch(authServiceProvider);
  return LoginViewModel(service);
});
