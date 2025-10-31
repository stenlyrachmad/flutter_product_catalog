import 'package:flutter_bloc/flutter_bloc.dart';
import 'products_event.dart';
import 'products_state.dart';
import '../data/product_repository.dart';
import '../models/product.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository repository;
  List<Product> _cache = [];

  ProductsBloc(this.repository) : super(ProductsInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductsLoading());
      final result = await repository.fetchAllProducts();
      result.fold(
        (failure) => emit(ProductsError(failure.message)),
        (list) {
          _cache = list;
          emit(ProductsLoaded(list));
        },
      );
    });

    on<RefreshProducts>((event, emit) async {
      emit(ProductsLoading());
      final result = await repository.fetchAllProducts();
      result.fold(
        (failure) => emit(ProductsError(failure.message)),
        (list) {
          _cache = list;
          emit(ProductsLoaded(list));
        },
      );
    });

    on<SearchProducts>((event, emit) {
      final query = event.query.toLowerCase().trim();
      if (query.isEmpty) {
        emit(ProductsLoaded(_cache));
      } else {
        final filtered = _cache
            .where((p) =>
                p.title.toLowerCase().contains(query) ||
                p.category.toLowerCase().contains(query))
            .toList();
        emit(ProductsLoaded(filtered, query: query));
      }
    });
  }
}
