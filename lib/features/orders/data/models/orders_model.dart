import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba_tecnica_juan/features/orders/domain/domain.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/data/data.dart';

class OrdersModel extends Orders {
  factory OrdersModel.fromMap(Map<String, dynamic> map) {
    return OrdersModel(
      name: map['nameOrder'],
      listProduct: List<ProductCartModel>.from(
        map['listProduct'].map(
          (x) => ProductCartModel.fromMap(x),
        ),
      ),
    );
  }
  factory OrdersModel.fromJson(String source) =>
      OrdersModel.fromMap(json.decode(source));

  OrdersModel({
    this.name,
    this.listProduct,
  });

  @override
  final Timestamp name;
  @override
  final List<ProductCartModel> listProduct;
}
