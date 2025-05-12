import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/constants/api_urls.dart';
import 'package:statemanagement/models/car_model.dart';
import '../service/api_repo.dart';

class CarViewModel extends StateNotifier<AsyncValue<List<CarModel>>> {
  final ApiRepo repo;
  final BuildContext context;

  CarViewModel(this.repo, this.context) : super(const AsyncValue.loading()) {
    fetchCars();
  }

  Future<void> fetchCars() async {
    final response = await repo.getRequestHTTP(context, ApiUrl.carList);
    if (response != null && response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      print(jsonBody);
      final List<dynamic> data = jsonBody['cars'];
      final cars = data.map((e) => CarModel.fromJson(e)).toList();
      state = AsyncValue.data(cars);
    } else {
      repo.handleError(response, context);
      state = AsyncValue.error("Failed to load car data", StackTrace.current);
    }
  }
}
