import 'package:equatable/equatable.dart';
import '../models/product.dart';

abstract class ProductsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;
  final String? query;
  ProductsLoaded(this.products, {this.query});
  @override
  List<Object?> get props => [products, query];
}

class ProductsError extends ProductsState {
  final String message;
  ProductsError(this.message);
  @override
  List<Object?> get props => [message];
}
