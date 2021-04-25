import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/quantity.dart';

class Product extends Equatable {
  Product({
    this.id,
    this.name,
    this.sku,
    this.description,
    this.urlImage,
    this.quantity,
  });
  final String id;
  final String name;
  final String sku;
  final String description;
  final String urlImage;
  final Quantity quantity;

  @override
  List<Object> get props => [id, name, sku, description, urlImage, quantity];
}
