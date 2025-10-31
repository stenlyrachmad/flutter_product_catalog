import 'package:flutter_product_catalog/core/app_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'core/dio_client.dart';
import 'data/product_repository.dart';

final GetIt di = GetIt.instance;

void setupDI() {
  // Dio
  final dio = Dio(BaseOptions(
    baseUrl: AppConstants.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  di.registerLazySingleton<Dio>(() => dio);
  di.registerLazySingleton<DioClient>(() => DioClient(di<Dio>()));

  // Repositories
  di.registerLazySingleton<ProductRepository>(
      () => ProductRepository(di<DioClient>()));
}
