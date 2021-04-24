import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba_tecnica_juan/features/home/home.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';

class HomeDataSourceMock extends Mock implements HomeDataSource {}

void main() {
  HomeRepositoryImpl _repositoryImpl;
  HomeDataSourceMock _datasource;
  ProductModel _productModel;
  setUp(() {
    _productModel = ProductModel();
    _datasource = HomeDataSourceMock();
    _repositoryImpl = HomeRepositoryImpl(_datasource);
  });

  test('It should return Product list, if datasource was successful', () async {
    when(_datasource.getDatasource()).thenAnswer(
      (_) async => <ProductModel>[_productModel],
    );

    final _result = await _repositoryImpl.getProducts();

    expect(_result.fold(id, id), isA<List<Product>>());
    verify(_repositoryImpl.getProducts()).called(1);
  });

  group('Test when unsuccessful', () {
    test('If there are DatasourceError , should return HomeError', () async {
      when(_datasource.getDatasource()).thenThrow(DataSourceError());

      final _result = await _repositoryImpl.getProducts();

      expect(_result.fold(id, id), isA<HomeError>());
      verify(_repositoryImpl.getProducts()).called(1);
    });

    test('If there is not internet   should return NotConnection', () async {
      when(_datasource.getDatasource()).thenThrow(const SocketException(''));

      final _result = await _repositoryImpl.getProducts();

      expect(_result.fold(id, id), isA<NotConnection>());
      verify(_repositoryImpl.getProducts()).called(1);
    });

    test('If there are any error , should return DefaultError', () async {
      when(_datasource.getDatasource()).thenThrow(ArgumentError());

      final _result = await _repositoryImpl.getProducts();

      expect(_result.fold(id, id), isA<DefaultError>());
      verify(_repositoryImpl.getProducts()).called(1);
    });
  });
}
