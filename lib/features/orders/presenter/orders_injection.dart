import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_juan/features/orders/orders.dart';

import 'bloc/bloc.dart';
import 'ui/orders_page.dart';

class OrdersInjection extends StatelessWidget {
  const OrdersInjection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<OrdersDataSource>(
          create: (context) => FirebaseOrder(),
        ),
        RepositoryProvider<OrdersRepositories>(
          create: (context) => OrdersRepositoryImpl(
            context.read<OrdersDataSource>(),
          ),
        ),
        RepositoryProvider<GetOrders>(
          create: (context) => GetOrdersImpl(
            context.read<OrdersRepositories>(),
          ),
        ),
      ],
      child: BlocProvider<OrdersBloc>(
        create: (BuildContext context) => OrdersBloc(
          context.read<GetOrders>(),
        )..add(
            LoadDataEvent(),
          ),
        child: const OrdersPage(),
      ),
    );
  }
}
