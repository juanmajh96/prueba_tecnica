import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';
import 'package:prueba_tecnica_juan/features/orders/orders.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/data/models/models.dart';

class MockOrdersExternal implements OrdersDataSource {
  @override
  Future<List<OrdersModel>> getDatasource() async {
    return [
      OrdersModel(
        name: Timestamp(22, 22),
        listProduct: [
          ProductCartModel(
              id: '1',
              name: 'Sukini Amarillo',
              sku: 'SI6A',
              description: 'Prueba',
              urlImage:
                  'https://fruverya.co/wp-content/uploads/2018/10/zuquniama.jpg',
              quantity: Quantity(quantity: 1)),
          ProductCartModel(
              id: '2',
              name: 'Sukini Verde',
              sku: 'SI6V',
              description: 'Prueba',
              urlImage:
                  'https://fruterox.co/wp-content/uploads/2020/07/Zucchini_verde.jpg',
              quantity: Quantity(quantity: 1)),
        ],
      )
    ];
  }
}
