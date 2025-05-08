class CounterModel {
  final int value;

  const CounterModel(this.value);

  CounterModel copyWith({int? value}) {
    return CounterModel(value ?? this.value);
  }
}
