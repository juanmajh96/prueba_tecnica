import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba_tecnica_juan/features/orders/orders.dart';

class FirebaseOrder implements OrdersDataSource {
  @override
  Future<List<OrdersModel>> getDatasource() async {
    final _result = await FirebaseFirestore.instance
        .collection('orders')
        .orderBy('nameOrder', descending: true)
        .get();

    return _result.docs
        .map(
          (item) => OrdersModel.fromMap(item.data()),
        )
        .toList();
  }
}
