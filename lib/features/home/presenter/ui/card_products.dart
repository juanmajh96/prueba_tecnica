import 'package:flutter/material.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';

class CardProducts extends StatelessWidget {
  const CardProducts({
    Key key,
    this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [],
          ),
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(product.urlImage),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  child: Text(product.name),
                ),
                Expanded(
                  child: Text(product.description),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
