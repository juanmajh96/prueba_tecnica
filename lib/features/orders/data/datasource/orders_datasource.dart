import 'package:prueba_tecnica_juan/features/orders/data/models/models.dart';

abstract class OrdersDataSource {
  Future<List<OrdersModel>> getDatasource();
}
