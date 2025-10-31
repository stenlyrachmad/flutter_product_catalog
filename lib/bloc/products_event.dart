import 'package:equatable/equatable.dart';

abstract class ProductsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchProducts extends ProductsEvent {}

class SearchProducts extends ProductsEvent {
  final String query;
  SearchProducts(this.query);
  @override
  List<Object?> get props => [query];
}

class RefreshProducts extends ProductsEvent {}
