import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/counter_model.dart';
import '../viewmodel/counter_view_model.dart';

final counterProvider =
StateNotifierProvider<CounterViewModel, CounterModel>((ref) {
  return CounterViewModel();
});
