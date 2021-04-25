import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/shopping_cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(
    this._readProduct,
    this._updateProduct,
    this._deleteProduct,
  ) : super(CartLoadingState());

  final ReadProduct<List<Product>> _readProduct;
  final UpdateProduct _updateProduct;
  final DeleteProduct _deleteProduct;

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is LoadDataEvent) {
      yield CartLoadingState();
      final _result = await _readProduct();
      yield await _result.fold(
        (homeError) async {
          if (homeError is NotConnection) {
            return CartNotInternetState();
          }
          return CartErrorState();
        },
        (listProducts) async {
          return CartCompleteState(listProducts);
        },
      );
    } else if (event is UpdateDataEvent) {
      await _updateProduct(event.product);
    } else if (event is DeleteEvent) {
      await _deleteProduct(event.product);
    }
  }
}
