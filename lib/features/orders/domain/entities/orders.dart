import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';

class Orders {
  Orders({
    this.name,
    this.listProduct,
  });

  final Timestamp name;
  final List<Product> listProduct;
}
