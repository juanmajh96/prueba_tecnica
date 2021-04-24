import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/product.dart';
import 'package:prueba_tecnica_juan/features/home/domain/domain.dart';

class HomeRepositoriesMock extends Mock implements HomeRepositories {}

void main() {
  HomeRepositoriesMock _repositories;
  AddProductImpl _usecases;
  Product _product;
  setUp(() {
    _product = Product();
    _repositories = HomeRepositoriesMock();
    _usecases = AddProductImpl(_repositories);
  });

  test('It should return true if It work good', () async {
    when(_repositories.addProduct(any)).thenAnswer(
      (_) async => const Right(true),
    );

    final _result = await _usecases(_product);

    expect(_result, const Right(true));
    verify(_repositories.addProduct(_product)).called(1);
  });

  test('It should return CartError if It not work good ', () {
    when(_repositories.addProduct(any)).thenThrow(HomeError());

    final _result = _usecases(_product);

    expect(
      _result,
      throwsA(
        isA<HomeError>(),
      ),
    );
  });
}
