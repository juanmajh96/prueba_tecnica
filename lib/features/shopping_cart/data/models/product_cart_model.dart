import 'dart:convert';

import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';

class ProductCartModel extends Product {
  factory ProductCartModel.fromMap(Map<String, dynamic> map) {
    return ProductCartModel(
      id: map['id'],
      name: map['name'],
      sku: map['sku'],
      description: map['description'],
      urlImage: map['urlImage'],
      quantity: Quantity(quantity: map['quantity']),
    );
  }
  factory ProductCartModel.fromJson(String source) =>
      ProductCartModel.fromMap(json.decode(source));

  ProductCartModel({
    this.id,
    this.name,
    this.sku,
    this.description,
    this.urlImage,
    this.quantity,
  });
  @override
  final String id;
  @override
  final String name;
  @override
  final String sku;
  @override
  final String description;
  @override
  final String urlImage;
  @override
  final Quantity quantity;

  Map<String, dynamic> toMap(Product product) {
    return {
      'id': product.id,
      'name': product.name,
      'sku': product.sku,
      'description': product.description,
      'urlImage': product.urlImage,
      'quantity': product.quantity.quantity,
    };
  }
}
