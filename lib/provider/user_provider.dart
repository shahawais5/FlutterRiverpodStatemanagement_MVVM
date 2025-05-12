import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../service/api_repo.dart';
import '../viewmodel/user_viewmodel.dart';

final apiRepoProvider = Provider<ApiRepo>((ref) => ApiRepo());

final userListProvider = StateNotifierProvider.family<UserViewModel,
    AsyncValue<List<User>>, BuildContext>((ref, context) {
  final repo = ref.watch(apiRepoProvider);
  return UserViewModel(repo, context);
});
