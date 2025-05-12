import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/car_provider.dart';

class CarScreen extends ConsumerWidget {
  const CarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carState = ref.watch(carProvider(context));

    return Scaffold(
      appBar: AppBar(title: const Text("Cars")),
      body: carState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (cars) => ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: cars.length,
          itemBuilder: (_, index) {
            final car = cars[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1628519592419-bf288f08cef5?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c3BvcnRzJTIwY2FyfGVufDB8fDB8fHww',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${car.make} ${car.model} (${car.year})',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text('Price: ${car.price}', style: const TextStyle(color: Colors.green)),
                        const SizedBox(height: 8),
                        Text('VIN: ${car.vin}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                        const SizedBox(height: 8),
                        Text(car.available ? 'Available' : 'Out of Stock',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: car.available ? Colors.green : Colors.red,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
