import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/constants/api_urls.dart';
import '../models/user_model.dart';
import '../service/api_repo.dart';

class UserViewModel extends StateNotifier<AsyncValue<List<User>>> {
  final ApiRepo repo;
  final BuildContext context;

  UserViewModel(this.repo, this.context) : super(const AsyncValue.loading()) {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final response = await repo.getRequestHTTP(context, ApiUrl.userList);
    if (response != null && response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final users = data.map((e) => User.fromJson(e)).toList();
      state = AsyncValue.data(users);
    } else {
      repo.handleError(response, context);
      state = AsyncValue.error("Failed to load users", StackTrace.current);
    }
  }
}
