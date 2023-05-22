import '../models/product_model.dart';

abstract class ProductState {}
//Inicial, Success, Error, Loading

class InitialProductState extends ProductState {}

class SucessProductState extends ProductState {
  final List<ProductModel> products;

  SucessProductState(this.products);
}

class LoadingProductState extends ProductState {}

class ErrorProductState extends ProductState {
  final String message;

  ErrorProductState(this.message);
}
