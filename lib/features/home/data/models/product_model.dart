import 'dart:convert';

import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';

class ProductModel extends Product {
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      sku: map['sku'],
      description: map['description'],
      urlImage: map['urlImage'],
      quantity: Quantity(),
    );
  }

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  ProductModel(
      {this.id,
      this.name,
      this.sku,
      this.description,
      this.urlImage,
      this.quantity});
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

  Map<String, dynamic> toMap(ProductModel productModel) {
    return {
      'id': productModel.id,
      'name': productModel.name,
      'sku': productModel.sku,
      'description': productModel.description,
      'urlImage': productModel.urlImage,
      'quantity': productModel.quantity.quantity,
    };
  }
}
