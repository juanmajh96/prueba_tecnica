import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/shopping_cart.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';

import '../../../../core/entities/product.dart';

class CartDataSourceMock extends Mock implements CartDatasource {}

void main() {
  CartRepositoryImpl _repositoryImpl;
  CartDataSourceMock _datasource;
  setUp(() {
    _datasource = CartDataSourceMock();
    _repositoryImpl = CartRepositoryImpl(_datasource);
  });

  group('ReadProduct', () {
    test('It should return Product list, if datasource was successful',
        () async {
      when(_datasource.readProductdasource()).thenAnswer(
        (_) async => const <ProductCartModel>[],
      );

      final _result = await _repositoryImpl.readProduct();

      expect(_result.fold(id, id), isA<List<Product>>());
      verify(_repositoryImpl.readProduct()).called(1);
    });

    group('Test when unsuccessful', () {
      test('If there are DatasourceError , should return HomeError', () async {
        when(_datasource.readProductdasource()).thenThrow(DataSourceError());

        final _result = await _repositoryImpl.readProduct();

        expect(_result.fold(id, id), isA<CartError>());
        verify(_repositoryImpl.readProduct()).called(1);
      });

      test('If there is not internet should return NotConnection', () async {
        when(_datasource.readProductdasource())
            .thenThrow(const SocketException(''));

        final _result = await _repositoryImpl.readProduct();

        expect(_result.fold(id, id), isA<NotConnection>());
        verify(_repositoryImpl.readProduct()).called(1);
      });

      test('If there are any error , should return DefaultError', () async {
        when(_datasource.readProductdasource()).thenThrow(ArgumentError());

        final _result = await _repositoryImpl.readProduct();

        expect(_result.fold(id, id), isA<DefaultError>());
        verify(_repositoryImpl.readProduct()).called(1);
      });
    });
  });

  group('AddProduct', () {
    test('It should return true, if datasource was successful', () async {
      when(_datasource.addProduct(any)).thenAnswer(
        (_) async => true,
      );

      final _result = await _repositoryImpl.addProduct(product);

      expect(_result.fold(id, id), isTrue);
      verify(_repositoryImpl.addProduct(any)).called(1);
    });

    group('Test when unsuccessful', () {
      test('If there are DatasourceError , should return HomeError', () async {
        when(_datasource.addProduct(any)).thenThrow(DataSourceError());

        final _result = await _repositoryImpl.addProduct(product);

        expect(_result.fold(id, id), isA<CartError>());
        verify(_repositoryImpl.addProduct(any)).called(1);
      });

      test('If there is not internet should return NotConnection', () async {
        when(_datasource.addProduct(any)).thenThrow(const SocketException(''));

        final _result = await _repositoryImpl.addProduct(product);

        expect(_result.fold(id, id), isA<NotConnection>());
        verify(_repositoryImpl.addProduct(any)).called(1);
      });

      test('If there are any error , should return DefaultError', () async {
        when(_datasource.addProduct(any)).thenThrow(ArgumentError());

        final _result = await _repositoryImpl.addProduct(product);

        expect(_result.fold(id, id), isA<DefaultError>());
        verify(_repositoryImpl.addProduct(any)).called(1);
      });
    });
  });

  group('UpdateProduct', () {
    test('It should return true, if datasource was successful', () async {
      when(_datasource.updateProduct(any)).thenAnswer(
        (_) async => true,
      );

      final _result = await _repositoryImpl.updateProduct(product);

      expect(_result.fold(id, id), isTrue);
      verify(_repositoryImpl.updateProduct(any)).called(1);
    });

    group('Test when unsuccessful', () {
      test('If there are DatasourceError , should return HomeError', () async {
        when(_datasource.updateProduct(any)).thenThrow(DataSourceError());

        final _result = await _repositoryImpl.updateProduct(product);

        expect(_result.fold(id, id), isA<CartError>());
        verify(_repositoryImpl.updateProduct(any)).called(1);
      });

      test('If there is not internet should return NotConnection', () async {
        when(_datasource.updateProduct(any))
            .thenThrow(const SocketException(''));

        final _result = await _repositoryImpl.updateProduct(product);

        expect(_result.fold(id, id), isA<NotConnection>());
        verify(_repositoryImpl.updateProduct(any)).called(1);
      });

      test('If there are any error , should return DefaultError', () async {
        when(_datasource.updateProduct(any)).thenThrow(ArgumentError());

        final _result = await _repositoryImpl.updateProduct(product);

        expect(_result.fold(id, id), isA<DefaultError>());
        verify(_repositoryImpl.updateProduct(any)).called(1);
      });
    });
  });

  group('DeleteProduct', () {
    test('It should return true, if datasource was successful', () async {
      when(_datasource.deleteProduct(any)).thenAnswer(
        (_) async => true,
      );

      final _result = await _repositoryImpl.deleteProduct(product);

      expect(_result.fold(id, id), isTrue);
      verify(_repositoryImpl.deleteProduct(any)).called(1);
    });

    group('Test when unsuccessful', () {
      test('If there are DatasourceError , should return HomeError', () async {
        when(_datasource.deleteProduct(any)).thenThrow(DataSourceError());

        final _result = await _repositoryImpl.deleteProduct(product);

        expect(_result.fold(id, id), isA<CartError>());
        verify(_repositoryImpl.deleteProduct(any)).called(1);
      });

      test('If there is not internet should return NotConnection', () async {
        when(_datasource.deleteProduct(any))
            .thenThrow(const SocketException(''));

        final _result = await _repositoryImpl.deleteProduct(product);

        expect(_result.fold(id, id), isA<NotConnection>());
        verify(_repositoryImpl.deleteProduct(any)).called(1);
      });

      test('If there are any error , should return DefaultError', () async {
        when(_datasource.deleteProduct(any)).thenThrow(ArgumentError());

        final _result = await _repositoryImpl.deleteProduct(product);

        expect(_result.fold(id, id), isA<DefaultError>());
        verify(_repositoryImpl.deleteProduct(any)).called(1);
      });
    });
  });
}
