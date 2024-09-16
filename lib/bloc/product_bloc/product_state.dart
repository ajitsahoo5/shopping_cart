part of 'product_bloc.dart';

abstract class ProductState {}

class ProductInitial extends ProductState{}

class ProductLoading extends ProductState{}

class ProductLoaded extends ProductState {
  final List<Product> products;
  // final bool hasMore;

  ProductLoaded({required this.products});
}

class ProductError extends ProductState {
  final String message;

  ProductError({required this.message});
}
