import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/product.dart';
import 'package:prueba_tecnica_juan/features/home/domain/domain.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc(this._addProduct) : super(DetailsInitial());

  final AddProduct<bool, Product> _addProduct;

  @override
  Stream<DetailsState> mapEventToState(
    DetailsEvent event,
  ) async* {
    if (event is AddProductEvent) {
      yield DetailsLoading();
      final _result = await _addProduct(event.product);
      yield await _result.fold(
        (homeError) async {
          if (homeError is NotConnection) {
            return DetailsNotInternetState();
          }
          return DetailsErrorState();
        },
        (listProducts) async {
          return DetailsInitial();
        },
      );
    }
  }
}
