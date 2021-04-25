import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/domain/errors/errors.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/domain/repositories/repositories.dart';

abstract class CreateOrder<Output, Input> {
  Future<Either<CartError, Output>> call(Input product);
}

class CreateOrderImpl implements CreateOrder<bool, List<Product>> {
  CreateOrderImpl(this._repositories);
  final CartRepositories _repositories;

  @override
  Future<Either<CartError, bool>> call(List<Product> productList) async {
    return await _repositories.createOrder(productList);
  }
}
