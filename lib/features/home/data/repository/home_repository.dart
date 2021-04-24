import 'dart:io';

import 'package:prueba_tecnica_juan/features/home/data/datasource/datasource.dart';
import 'package:prueba_tecnica_juan/features/home/domain/errors/home_errors.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';
import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica_juan/features/home/domain/repositories/repositories.dart';

class HomeRepositoryImpl implements HomeRepositories {
  HomeRepositoryImpl(this._homeDataSource);
  final HomeDataSource _homeDataSource;

  @override
  Future<Either<HomeError, List<Product>>> getProducts() async {
    try {
      final _result = await _homeDataSource.getDatasource();
      return Right(_result);
    } on HomeError catch (e) {
      return Left(e);
    } on SocketException {
      return Left(
        NotConnection(),
      );
    } catch (e) {
      return Left(
        DefaultError(messageError: e.toString()),
      );
    }
  }

  @override
  Future<Either<HomeError, bool>> addProduct(Product product) async {
    try {
      final _result = await _homeDataSource.addProduct(product);
      return Right(_result);
    } on HomeError catch (e) {
      return Left(e);
    } on SocketException {
      return Left(
        NotConnection(),
      );
    } catch (e) {
      return Left(
        DefaultError(messageError: e.toString()),
      );
    }
  }
}
