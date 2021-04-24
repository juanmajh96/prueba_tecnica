import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';
import 'package:prueba_tecnica_juan/features/home/domain/errors/errors.dart';
import 'package:prueba_tecnica_juan/features/home/domain/repositories/home_repositories.dart';

abstract class GetProducts<Output> {
  Future<Either<HomeError, Output>> call();
}

class GetProductsImpl implements GetProducts<List<Product>> {
  GetProductsImpl(this._repositories);
  final HomeRepositories _repositories;

  @override
  Future<Either<HomeError, List<Product>>> call() async =>
      await _repositories.getProducts();
}
