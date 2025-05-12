import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/car_model.dart';
import '../viewmodel/car_viewmodel.dart';
import 'package:flutter/material.dart';
import 'login_provider.dart';

// You need to pass BuildContext, so use AutoDispose family provider
final carProvider = StateNotifierProvider.autoDispose
    .family<CarViewModel, AsyncValue<List<CarModel>>, BuildContext>(
      (ref, context) {
    final api = ref.watch(authServiceProvider); // Already created ApiRepo
    return CarViewModel(api, context);
  },
);
