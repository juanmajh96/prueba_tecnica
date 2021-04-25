import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_juan/custom_widgets.dart/view_list_products.dart';
import 'package:prueba_tecnica_juan/features/orders/presenter/bloc/bloc.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Ordenes',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          if (state is OrdersCompleteState) {
            return ListView.builder(
              itemCount: state.orders.length,
              itemBuilder: (context, index) {
                final items = state.orders[index];
                return ExpansionTile(
                  title: Text(
                    items.name.toDate().toString(),
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),
                  children: items.listProduct
                      .map(
                        (product) => Row(
                          children: [
                            ViewListProducts(
                              item: product,
                            ),
                          ],
                        ),
                      )
                      .toList(),
                );
              },
            );
          } else if (state is OrdersLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is OrdersNotInternetState) {
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
