import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/presenter/bloc/cart_bloc.dart';

import 'cart_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Carrito de compras',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state is OrderCreated) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is CartCompleteState) {
            return CartList(
              listProduct: state.products,
            );
          } else if (state is CartLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CartNotInternetState) {
            return const Center(
              child: Text('no hay internet'),
            );
          } else {
            return const Center(
              child: Text(
                  'trabamos continuamente para minimizar estas situaciones'),
            );
          }
        },
      ),
    );
  }
}
