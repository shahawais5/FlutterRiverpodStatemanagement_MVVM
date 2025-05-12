import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/constants/api_urls.dart';
import '../models/product_model.dart';
import '../service/api_repo.dart';

class ProductViewModel extends StateNotifier<AsyncValue<List<Product>>> {
  final ApiRepo repo;
  final BuildContext context;

  ProductViewModel(this.repo, this.context) : super(const AsyncValue.loading()) {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response = await repo.getRequestHTTP(context, ApiUrl.productList);

    if (response != null && response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final products = data.map((e) => Product.fromJson(e)).toList();
      state = AsyncValue.data(products);
    } else {
      repo.handleError(response, context);
      state = AsyncValue.error("Failed to load products", StackTrace.current);
    }
  }
}
