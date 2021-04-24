import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/shopping_cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(this._readProduct) : super(HomeLoadingState());

  final ReadProduct<List<Product>> _readProduct;

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is LoadDataEvent) {
      yield HomeLoadingState();
      final _result = await _readProduct();
      yield await _result.fold(
        (homeError) async {
          if (homeError is NotConnection) {
            return HomeNotInternetState();
          }
          return HomeErrorState();
        },
        (listProducts) async {
          return HomeCompleteState(listProducts);
        },
      );
    }
  }
}
