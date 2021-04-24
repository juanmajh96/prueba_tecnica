import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';
import 'package:prueba_tecnica_juan/features/orders/domain/domain.dart';

class OrdersModel extends Orders {
  OrdersModel({
    this.quantity,
    this.total,
    this.listProduct,
  });
  @override
  final int quantity;
  @override
  final int total;
  @override
  final List<Product> listProduct;
}
