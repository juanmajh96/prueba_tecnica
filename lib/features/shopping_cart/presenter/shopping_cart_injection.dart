import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/presenter/cubit/cubit.dart';
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
          create: (context) => FirebaseCartExternal(),
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
        RepositoryProvider<UpdateProduct>(
          create: (context) => UpdateProductImpl(
            context.read<CartRepositories>(),
          ),
        ),
        RepositoryProvider<DeleteProduct>(
          create: (context) => DeleteProductImpl(
            context.read<CartRepositories>(),
          ),
        ),
        RepositoryProvider<CreateOrder>(
          create: (context) => CreateOrderImpl(
            context.read<CartRepositories>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CartBloc>(
            create: (BuildContext context) => CartBloc(
              context.read<ReadProduct>(),
              context.read<UpdateProduct>(),
              context.read<DeleteProduct>(),
            )..add(
                LoadDataEvent(),
              ),
          ),
          BlocProvider<CreateOrderCubit>(
            create: (BuildContext context) => CreateOrderCubit(
              context.read<CreateOrder>(),
            ),
          ),
          BlocProvider<QuantityCubit>(
            create: (BuildContext context) => QuantityCubit(),
          ),
        ],
        child: const CartPage(),
      ),
    );
  }
}
