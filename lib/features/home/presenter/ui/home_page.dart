import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_juan/cubit_main/cubit_main.dart';
import 'package:prueba_tecnica_juan/features/home/presenter/bloc/bloc.dart';
import 'package:prueba_tecnica_juan/features/orders/presenter/presenter.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/presenter/presenter.dart';

import 'store_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _objectInCartAdded =
        BlocProvider.of<ObjectInCartCubit>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          BlocConsumer<ObjectInCartCubit, ObjectInCartState>(
            listener: (context, state) async {
              await Future.delayed(const Duration(milliseconds: 450));
              _objectInCartAdded.changeWidget(
                ObjectInCartInitial(),
              );
            },
            builder: (context, state) {
              return IconButton(
                onPressed: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ShoppingCartInjection(),
                    ),
                  );
                },
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, animation) => ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                  child: state is ObjectInCartAdded
                      ? Hero(
                          tag: 'list_${state.id}Cart',
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                              state.urlImage,
                            ),
                          ),
                        )
                      : const Icon(
                          Icons.shopping_cart_outlined,
                        ),
                ),
              );
            },
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
                color: const Color(0xFFF4C459),
                height: 200,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 3,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: Text('J'),
                        ),
                      ),
                      const Spacer(),
                      const Expanded(
                        flex: 1,
                        child: Text('Juan Manuel Jaramillo Henao '),
                      )
                    ],
                  ),
                )),
            ListTile(
              title: const Text('Productos'),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('Ordenes'),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () async {
                Navigator.pop(context);
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const OrdersInjection(
                      key: Key('OrdersInjection'),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Carrito de compras'),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () async {
                Navigator.pop(context);
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ShoppingCartInjection(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeCompleteState) {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(
                  30,
                ),
                bottomRight: Radius.circular(
                  30,
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: StoreList(
                  listProduct: state.products,
                ),
              ),
            );
          } else if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeNotInternetState) {
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
