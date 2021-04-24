import 'package:equatable/equatable.dart';

class Product extends Equatable {
  Product({
    this.id,
    this.name,
    this.sku,
    this.description,
    this.urlImage,
    this.quantity,
  });
  final int id;
  final String name;
  final String sku;
  final String description;
  final String urlImage;
  final int quantity;

  @override
  List<Object> get props => [id, name, sku, description, urlImage, quantity];
}
