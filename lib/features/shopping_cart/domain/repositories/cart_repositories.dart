import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/domain/errors/errors.dart';

abstract class CartRepositories {
  Future<Either<CartError, bool>> addProduct(Product product);
  Future<Either<CartError, bool>> deleteProduct(Product product);
  Future<Either<CartError, bool>> updateProduct(Product product);
  Future<Either<CartError, List<Product>>> readProduct();
}
