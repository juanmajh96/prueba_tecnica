import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/data/models/models.dart';

abstract class CartDatasource {
  Future<List<ProductCartModel>> readProductdasource();
  Future<bool> addProduct(Product product);
  Future<bool> deleteProduct(Product product);
  Future<bool> updateProduct(Product product);
}
