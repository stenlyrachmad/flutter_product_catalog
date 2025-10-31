import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../core/dio_client.dart';
import '../core/failure.dart';
import '../models/product.dart';

class ProductRepository {
  final DioClient client;
  ProductRepository(this.client);

  Future<Either<Failure, List<Product>>> fetchAllProducts() async {
    try {
      final response = await client.get('/products');
      if (response.statusCode == 200) {
        final data = response.data;

        final list = (data as List).map((e) {
          final map = e is Map
              ? Map<String, dynamic>.from(e)
              : json.decode(e as String) as Map<String, dynamic>;
          return Product.fromJson(map);
        }).toList();
        return Right(list);
      } else {
        return Left(Failure('Server error: ${response.statusCode}'));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Product>> fetchProductById(int id) async {
    try {
      final response = await client.get('/products/$id');
      if (response.statusCode == 200) {
        final map = Map<String, dynamic>.from(response.data as Map);
        return Right(Product.fromJson(map));
      } else {
        return Left(Failure('Server error: ${response.statusCode}'));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
