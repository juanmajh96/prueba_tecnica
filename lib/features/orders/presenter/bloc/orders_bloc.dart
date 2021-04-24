import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica_juan/features/orders/domain/domain.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc(this._getOrders) : super(OrdersLoadingState());

  final GetOrders<List<Orders>> _getOrders;

  @override
  Stream<OrdersState> mapEventToState(
    OrdersEvent event,
  ) async* {
    if (event is LoadDataEvent) {
      yield OrdersLoadingState();
      final _result = await _getOrders();
      yield await _result.fold(
        (homeError) async {
          if (homeError is NotConnection) {
            return OrdersNotInternetState();
          }
          return OrdersErrorState();
        },
        (listProducts) async {
          return OrdersCompleteState(listProducts);
        },
      );
    }
  }
}
