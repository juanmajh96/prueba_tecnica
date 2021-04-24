import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';
import 'package:prueba_tecnica_juan/features/home/domain/errors/errors.dart';
import 'package:prueba_tecnica_juan/features/home/domain/repositories/repositories.dart';

abstract class AddProduct<Output, Input> {
  Future<Either<HomeError, Output>> call(Input product);
}

class AddProductImpl implements AddProduct<bool, Product> {
  AddProductImpl(this._repositories);
  final HomeRepositories _repositories;

  @override
  Future<Either<HomeError, bool>> call(Product product) async {
    return await _repositories.addProduct(product);
  }
}
