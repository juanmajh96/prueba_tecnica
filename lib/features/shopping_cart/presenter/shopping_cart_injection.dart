import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/shopping_cart.dart';

import 'bloc/bloc.dart';
import 'ui/cart_page.dart';

class ShoppingCartInjection extends StatelessWidget {
  const ShoppingCartInjection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CartDatasource>(
          create: (context) => MockCartExternal(),
        ),
        RepositoryProvider<CartRepositories>(
          create: (context) => CartRepositoryImpl(
            context.read<CartDatasource>(),
          ),
        ),
        RepositoryProvider<ReadProduct>(
          create: (context) => ReadProductImpl(
            context.read<CartRepositories>(),
          ),
        ),
      ],
      child: BlocProvider<CartBloc>(
        create: (BuildContext context) => CartBloc(
          context.read<ReadProduct>(),
        )..add(
            LoadDataEvent(),
          ),
        child: const CartPage(),
      ),
    );
  }
}
