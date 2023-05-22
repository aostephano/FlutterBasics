import 'package:flutter/material.dart';
import 'package:uno/uno.dart';
import 'package:value_notifier/src/products/services/products_service.dart';
import 'package:value_notifier/src/products/states/product_state.dart';
import 'package:value_notifier/src/products/stores/product_store.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final store = ProductStore(ProductService(Uno()));

  @override
  void initState() {
    // Fetch products when Initialize app
    super.initState();
    store.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Page',
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: store,
        builder: (_, state, child) {
          if (state is LoadingProductState) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ErrorProductState) {
            Center(
              child: Text(state.message),
            );
          }
          if (state is SucessProductState) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (_, index) {
                final product = state.products[index];
                return ListTile(
                  title: Text('$product.title'),
                );
              },
            );
          }
          if (state is InitialProductState) {
            return Container(
              child: Text("No products yet"),
            );
          }
          //InitialProductState
          return Container();
        },
      ),
    );
  }
}
