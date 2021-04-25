import 'package:flutter/material.dart';

class OrderCreatedPage extends StatelessWidget {
  const OrderCreatedPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.check_circle_outlined,
            color: Colors.green,
            size: 100,
          ),
          Text(
            'Orden Creada',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
