import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/counter_model.dart';

class CounterViewModel extends StateNotifier<CounterModel> {
  CounterViewModel() : super(const CounterModel(0));

  void increment() {
    state = state.copyWith(value: state.value + 1);
  }

  void decrement() {
    state = state.copyWith(value: state.value - 1);
  }

  void reset() {
    state = const CounterModel(0);
  }
}
