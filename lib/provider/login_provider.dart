import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/service/api_repo.dart';
import '../models/login_model.dart';
import '../viewmodel/login_viewmodel.dart';

final authServiceProvider = Provider<ApiRepo>((ref) => ApiRepo());

final loginProvider = StateNotifierProvider<LoginViewModel, AsyncValue<AuthModel?>>((ref) {
  final service = ref.watch(authServiceProvider);
  return LoginViewModel(service);
});