import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/domain/errors/cart_error.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/domain/repositories/repositories.dart';

abstract class ReadProduct<Output> {
  Future<Either<CartError, Output>> call();
}

class ReadProductImpl implements ReadProduct<List<Product>> {
  ReadProductImpl(this._repositories);
  final CartRepositories _repositories;

  @override
  Future<Either<CartError, List<Product>>> call() async =>
      await _repositories.readProduct();
}
