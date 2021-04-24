import 'package:equatable/equatable.dart';

class Product extends Equatable {
  Product({
    this.id,
    this.name,
    this.sku,
    this.description,
    this.urlImage,
  });
  final int id;
  final String name;
  final String sku;
  final String description;
  final String urlImage;

  @override
  List<Object> get props => [id, name, sku, description, urlImage];
}
