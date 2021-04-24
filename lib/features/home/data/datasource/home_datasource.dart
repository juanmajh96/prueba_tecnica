import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';
import 'package:prueba_tecnica_juan/features/home/data/models/product_model.dart';

abstract class HomeDataSource {
  Future<List<ProductModel>> getDatasource();
  Future<bool> addProduct(Product product);
}
