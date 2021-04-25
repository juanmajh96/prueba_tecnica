import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/product.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/shopping_cart.dart';

class FirebaseCartExternal implements CartDatasource {
  @override
  Future<bool> deleteProduct(Product product) async {
    await FirebaseFirestore.instance
        .collection('cart')
        .doc(product.id)
        .delete();
    return true;
  }

  @override
  Future<List<ProductCartModel>> readProductdasource() async {
    final _result = await FirebaseFirestore.instance.collection('cart').get();

    return _result.docs
        .map(
          (item) => ProductCartModel.fromMap(item.data()),
        )
        .toList();
  }

  @override
  Future<bool> updateProduct(Product product) async {
    await FirebaseFirestore.instance.collection('cart').doc(product.id).set(
          ProductCartModel().toMap(product),
          SetOptions(merge: false),
        );
    return true;
  }

  @override
  Future<bool> createOrder(List<Product> productList) async {
    final date = DateTime.now();
    productList.map(deleteProduct).toList();
    await FirebaseFirestore.instance
        .collection('orders')
        .doc(date.toString())
        .set(
      {
        'nameOrder': date,
        'listProduct': productList
            .map(
              (product) => ProductCartModel().toMap(product),
            )
            .toList(),
      },
      SetOptions(merge: false),
    );
    return true;
  }
}
