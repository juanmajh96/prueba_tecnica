import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba_tecnica_juan/features/home/domain/domain.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';

class HomeRepositoriesMock extends Mock implements HomeRepositories {}

void main() {
  HomeRepositoriesMock _repositories;
  GetProductsImpl _usecases;
  setUp(() {
    _repositories = HomeRepositoriesMock();
    _usecases = GetProductsImpl(_repositories);
  });

  test('It should return Product list if It work good', () async {
    when(_repositories.getProducts()).thenAnswer(
      (_) async => const Right(<Product>[]),
    );

    final _result = await _usecases();

    expect(_result, const Right(<Product>[]));
    verify(_repositories.getProducts()).called(1);
  });

  test('It should return HomeError if It not work good ', () {
    when(_repositories.getProducts()).thenThrow(HomeError());

    final _result = _usecases();

    expect(
      _result,
      throwsA(
        isA<HomeError>(),
      ),
    );
  });
}
