import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/presenter/bloc/cart_bloc.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/presenter/cubit/cubit.dart';

import 'cart_list.dart';
import 'order_created.dart';

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
      body: BlocConsumer<CreateOrderCubit, CreateOrderState>(
        listener: (context, state) async {
          if (state is CreateOrderStateComplete) {
            await Future.delayed(const Duration(seconds: 2));
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is CreateOrderStateInitial) {
            return BlocBuilder<CartBloc, CartState>(
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
                      '''trabamos continuamente
                         para minimizar estas situaciones''',
                    ),
                  );
                }
              },
            );
          } else {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              child: state is CreateOrderStateInProgessing
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : state is CreateOrderStateComplete
                      ? const OrderCreatedPage()
                      : const Center(
                          child: Text(
                            '''trabamos continuamente
                         para minimizar estas situaciones''',
                          ),
                        ),
            );
          }
        },
      ),
    );
  }
}
