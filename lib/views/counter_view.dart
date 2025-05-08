import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/counter_provider.dart';

class CounterView extends ConsumerWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final viewModel = ref.read(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('MVVM Riverpod Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter:', style: TextStyle(fontSize: 20)),
            Text('${counter.value}', style: const TextStyle(fontSize: 40)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: viewModel.decrement, icon: const Icon(Icons.remove)),
                IconButton(onPressed: viewModel.reset, icon: const Icon(Icons.refresh)),
                IconButton(onPressed: viewModel.increment, icon: const Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
