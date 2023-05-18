import 'package:flutter/material.dart';
import 'package:value_notifier/src/products/models/product_model.dart';
import '../services/products_service.dart';

class ProductStore extends ValueNotifier<ProductModel> {
  final ProductService service;

  ProductStore(this.service) : super([] as ProductModel);

  Future fetchProducts() async {
    final products = await service.fetchProducts();

    value = products as ProductModel;
  }
}
