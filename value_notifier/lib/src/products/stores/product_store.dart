import 'package:flutter/material.dart';
import 'package:value_notifier/src/products/states/product_state.dart';
import '../services/products_service.dart';

class ProductStore extends ValueNotifier<ProductState> {
  final ProductService service;

  ProductStore(this.service) : super(InitialProductState());

  //Always Future method cuz is a web func()
  Future fetchProducts() async {
    value = LoadingProductState();
    await Future.delayed(Duration(seconds: 1));
    try {
      final products = await service.fetchProducts();
      value = SucessProductState(products);
    } catch (e) {
      value = ErrorProductState(e.toString());
    }
  }
}
