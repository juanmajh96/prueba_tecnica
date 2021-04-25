import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';
import 'package:prueba_tecnica_juan/features/home/domain/repositories/repositories.dart';

import 'details_products.dart';
import 'dual_view.dart';

class StoreList extends StatelessWidget {
  const StoreList({Key key, @required this.listProduct}) : super(key: key);

  final List<Product> listProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
      child: DualView(
        aspectRatio: 0.7,
        offsetPercent: 0.3,
        spacing: 20,
        itemBuilder: (context, index) {
          final product = listProduct[index];
          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 800),
                  pageBuilder: (_, animation, __) {
                    return FadeTransition(
                      opacity: animation,
                      child: ProductDetails(
                        product: product,
                        homeRepositories:
                            RepositoryProvider.of<HomeRepositories>(context,
                                listen: false),
                      ),
                    );
                  },
                ),
              );
            },
            child: Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 8,
              shadowColor: Colors.black45,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Hero(
                        tag: 'list_${product.id}',
                        child: Image.network(
                          product.urlImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      product.sku,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: listProduct.length,
      ),
    );
  }
}
