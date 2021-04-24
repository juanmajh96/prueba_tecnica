import 'package:prueba_tecnica_juan/core/domain/entities/product.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/shopping_cart.dart';

class MockCartExternal implements CartDatasource {
  @override
  Future<bool> addProduct(Product product) async {
    return true;
  }

  @override
  Future<bool> deleteProduct(Product product) async {
    return true;
  }

  @override
  Future<List<ProductCartModel>> readProductdasource() async {
    return [
      ProductCartModel(
        id: 1,
        name: 'Sukini Amarillo',
        sku: 'SI6A',
        description: 'Prueba',
        urlImage:
            'https://fruverya.co/wp-content/uploads/2018/10/zuquniama.jpg',
      ),
      ProductCartModel(
        id: 2,
        name: 'Sukini Verde',
        sku: 'SI6V',
        description: 'Prueba',
        urlImage:
            'https://fruterox.co/wp-content/uploads/2020/07/Zucchini_verde.jpg',
      )
    ];
  }

  @override
  Future<bool> updateProduct(Product product) async {
    return true;
  }
}
