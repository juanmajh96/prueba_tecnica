import 'dart:io';

import 'package:prueba_tecnica_juan/features/shopping_cart/data/datasource/cart_datasource.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/domain/errors/cart_error.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/product.dart';
import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/domain/repositories/cart_repositories.dart';

class CartRepositoryImpl implements CartRepositories {
  CartRepositoryImpl(this._cartDatasource);
  final CartDatasource _cartDatasource;

  @override
  Future<Either<CartError, bool>> deleteProduct(Product product) async {
    try {
      final _result = await _cartDatasource.deleteProduct(product);
      return Right(_result);
    } on CartError catch (e) {
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
  Future<Either<CartError, List<Product>>> readProduct() async {
    try {
      final _result = await _cartDatasource.readProductdasource();
      return Right(_result);
    } on CartError catch (e) {
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
  Future<Either<CartError, bool>> updateProduct(Product product) async {
    try {
      final _result = await _cartDatasource.updateProduct(product);
      return Right(_result);
    } on CartError catch (e) {
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
  Future<Either<CartError, bool>> createOrder(List<Product> productList) async {
    try {
      final _result = await _cartDatasource.createOrder(productList);
      return Right(_result);
    } on CartError catch (e) {
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
