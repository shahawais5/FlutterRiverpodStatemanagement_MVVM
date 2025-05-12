import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_model.dart';
import '../viewmodel/product_viewmodel.dart';
import '../service/api_repo.dart';

final apiRepoProvider = Provider<ApiRepo>((ref) => ApiRepo());
final productProvider = StateNotifierProvider.family<ProductViewModel, AsyncValue<List<Product>>,
    BuildContext>((ref, context) {
  final repo = ref.watch(apiRepoProvider);
  return ProductViewModel(repo, context);
});
