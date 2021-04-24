import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';

class Orders {
  Orders({
    this.quantity,
    this.total,
    this.listProduct,
  });
  final int quantity;
  final int total;
  final List<Product> listProduct;
}
