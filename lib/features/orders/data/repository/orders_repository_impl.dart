import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica_juan/features/orders/orders.dart';

class OrdersRepositoryImpl implements OrdersRepositories {
  OrdersRepositoryImpl(this._dataSource);
  final OrdersDataSource _dataSource;

  @override
  Future<Either<OrdersErrors, List<Orders>>> getOrders() async {
    try {
      final _result = await _dataSource.getDatasource();
      return Right(_result);
    } on OrdersErrors catch (e) {
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
