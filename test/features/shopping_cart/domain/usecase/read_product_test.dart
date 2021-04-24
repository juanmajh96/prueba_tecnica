import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/product.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/domain/domain.dart';

import '../../../../core/mocks/cart_repositories_mock.dart';

void main() {
  CartRepositoriesMock _repositories;
  ReadProductImpl _usecases;
  setUp(() {
    _repositories = CartRepositoriesMock();
    _usecases = ReadProductImpl(_repositories);
  });

  test('It should return Product list if It work good', () async {
    when(_repositories.readProduct()).thenAnswer(
      (_) async => const Right(<Product>[]),
    );

    final _result = await _usecases();

    expect(_result, const Right(<Product>[]));
    verify(_repositories.readProduct()).called(1);
  });

  test('It should return CartError if It not work good ', () {
    when(_repositories.readProduct()).thenThrow(CartError());

    final _result = _usecases();

    expect(
      _result,
      throwsA(
        isA<CartError>(),
      ),
    );
  });
}
