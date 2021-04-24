import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/domain/errors/errors.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/domain/repositories/repositories.dart';

abstract class UpdateProduct<Output, Input> {
  Future<Either<CartError, Output>> call(Input product);
}

class UpdateProductImpl implements UpdateProduct<bool, Product> {
  UpdateProductImpl(this._repositories);
  final CartRepositories _repositories;

  @override
  Future<Either<CartError, bool>> call(Product product) async {
    return await _repositories.updateProduct(product);
  }
}
