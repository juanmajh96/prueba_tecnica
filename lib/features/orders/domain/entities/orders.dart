import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';

class Orders extends Equatable {
  Orders({
    this.name,
    this.listProduct,
  });

  final Timestamp name;
  final List<Product> listProduct;

  @override
  // TODO: implement props
  List<Object> get props => [name, listProduct];
}
