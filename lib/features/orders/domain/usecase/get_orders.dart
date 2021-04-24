import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica_juan/features/orders/domain/entities/entities.dart';
import 'package:prueba_tecnica_juan/features/orders/domain/errors/errors.dart';
import 'package:prueba_tecnica_juan/features/orders/domain/repositories/orders_repositories.dart';

abstract class GetOrders<Output> {
  Future<Either<OrdersErrors, Output>> call();
}

class GetOrdersImpl implements GetOrders<List<Orders>> {
  GetOrdersImpl(this._ordersRepositories);
  final OrdersRepositories _ordersRepositories;

  @override
  Future<Either<OrdersErrors, List<Orders>>> call() async {
    return await _ordersRepositories.getOrders();
  }
}
