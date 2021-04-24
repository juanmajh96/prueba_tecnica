import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica_juan/features/orders/domain/entities/entities.dart';
import 'package:prueba_tecnica_juan/features/orders/domain/errors/errors.dart';

abstract class OrdersRepositories {
  Future<Either<OrdersErrors, List<Orders>>> getOrders();
}
