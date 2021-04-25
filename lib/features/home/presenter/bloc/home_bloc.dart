import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:prueba_tecnica_juan/features/home/domain/domain.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getProducts,
  ) : super(HomeLoadingState());

  final GetProducts<List<Product>> _getProducts;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is LoadDataEvent) {
      yield HomeLoadingState();
      final _result = await _getProducts();
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
