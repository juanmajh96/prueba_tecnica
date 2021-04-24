import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';
import 'package:prueba_tecnica_juan/features/home/domain/errors/errors.dart';

abstract class HomeRepositories {
  Future<Either<HomeError, List<Product>>> getProducts();
  Future<Either<HomeError, bool>> addProduct(Product product);
}
