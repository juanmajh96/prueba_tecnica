import 'package:prueba_tecnica_juan/core/domain/entities/product.dart';
import 'package:prueba_tecnica_juan/features/home/data/data.dart';

class MockExternal implements HomeDataSource {
  @override
  Future<List<ProductModel>> getDatasource() async {
    return [
      ProductModel(
        id: 'fiOSOdOIXKmdo5CmpCdA',
        name: 'Sukini Amarillo',
        sku: 'SI6A',
        description: 'Prueba',
        urlImage:
            'https://fruverya.co/wp-content/uploads/2018/10/zuquniama.jpg',
      ),
      ProductModel(
        id: '31cFUTtGErM9C8PI5XTe',
        name: 'Sukini Verde',
        sku: 'SI6V',
        description: 'Prueba',
        urlImage:
            'https://fruterox.co/wp-content/uploads/2020/07/Zucchini_verde.jpg',
      ),
    ];
  }

  @override
  Future<bool> addProduct(Product product) async {
    return true;
  }
}
