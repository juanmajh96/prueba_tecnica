import 'package:flutter/material.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';

class ViewListProducts extends StatelessWidget {
  const ViewListProducts({Key key, @required this.item}) : super(key: key);

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
              item.urlImage,
            ),
          ),
          const SizedBox(width: 15),
          Text(item.quantity.toString()),
          const SizedBox(width: 10),
          const Text('x'),
          const SizedBox(width: 10),
          Text(item.name),
          const Spacer(),
        ],
      ),
    );
  }
}
