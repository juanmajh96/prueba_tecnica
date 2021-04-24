import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';

class ProductCartModel extends Product {
  ProductCartModel({
    this.id,
    this.name,
    this.sku,
    this.description,
    this.urlImage,
  });
  @override
  final int id;
  @override
  final String name;
  @override
  final String sku;
  @override
  final String description;
  @override
  final String urlImage;
}
