import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/product.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/domain/domain.dart';

import '../../../../core/mocks/cart_repositories_mock.dart';

void main() {
  CartRepositoriesMock _repositories;
  UpdateProductImpl _usecases;
  Product _product;
  setUp(() {
    _product = Product();
    _repositories = CartRepositoriesMock();
    _usecases = UpdateProductImpl(_repositories);
  });

  test('It should return true if It work good', () async {
    when(_repositories.updateProduct(any)).thenAnswer(
      (_) async => const Right(true),
    );

    final _result = await _usecases(_product);

    expect(_result, const Right(true));
    verify(_repositories.updateProduct(_product)).called(1);
  });

  test('It should return CartError if It not work good ', () {
    when(_repositories.updateProduct(any)).thenThrow(CartError());

    final _result = _usecases(_product);

    expect(
      _result,
      throwsA(
        isA<CartError>(),
      ),
    );
  });
}
