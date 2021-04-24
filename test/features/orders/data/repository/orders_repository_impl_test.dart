import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba_tecnica_juan/features/orders/orders.dart';

class OrdersDataSourceMock extends Mock implements OrdersDataSource {}

void main() {
  OrdersRepositoryImpl _repositoryImpl;
  OrdersDataSourceMock _datasource;
  OrdersModel _ordersModel;
  setUp(() {
    _ordersModel = OrdersModel();
    _datasource = OrdersDataSourceMock();
    _repositoryImpl = OrdersRepositoryImpl(_datasource);
  });

  test('It should return Ordeers list, if datasource was successful', () async {
    when(_datasource.getDatasource()).thenAnswer(
      (_) async => <OrdersModel>[_ordersModel],
    );

    final _result = await _repositoryImpl.getOrders();

    expect(_result.fold(id, id), isA<List<Orders>>());
    verify(_repositoryImpl.getOrders()).called(1);
  });

  group('Test when unsuccessful', () {
    test('If there are DatasourceError , should return HomeError', () async {
      when(_datasource.getDatasource()).thenThrow(DataSourceError());

      final _result = await _repositoryImpl.getOrders();

      expect(_result.fold(id, id), isA<OrdersErrors>());
      verify(_repositoryImpl.getOrders()).called(1);
    });

    test('If there is not internet   should return NotConnection', () async {
      when(_datasource.getDatasource()).thenThrow(const SocketException(''));

      final _result = await _repositoryImpl.getOrders();

      expect(_result.fold(id, id), isA<NotConnection>());
      verify(_repositoryImpl.getOrders()).called(1);
    });

    test('If there are any error , should return DefaultError', () async {
      when(_datasource.getDatasource()).thenThrow(ArgumentError());

      final _result = await _repositoryImpl.getOrders();

      expect(_result.fold(id, id), isA<DefaultError>());
      verify(_repositoryImpl.getOrders()).called(1);
    });
  });
}
