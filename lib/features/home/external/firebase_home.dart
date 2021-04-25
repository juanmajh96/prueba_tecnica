import 'dart:async';

import 'package:prueba_tecnica_juan/core/domain/entities/product.dart';
import 'package:prueba_tecnica_juan/features/home/home.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHome implements HomeDataSource {
  @override
  Future<List<ProductModel>> getDatasource() async {
    final _result =
        await FirebaseFirestore.instance.collection('products').get();

    return _result.docs
        .map(
          (item) => ProductModel.fromMap(item.data()),
        )
        .toList();
  }

  @override
  Future<bool> addProduct(Product product) async {
    await FirebaseFirestore.instance
        .collection('cart')
        .doc(product.id)
        .set(ProductModel().toMap(product), SetOptions(merge: false));
    return true;
  }
}
