import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/domain/usecase/usecases.dart';

part 'createorder_state.dart';

class CreateOrderCubit extends Cubit<CreateOrderState> {
  CreateOrderCubit(this._createOrder) : super(CreateOrderStateInitial());

  final CreateOrder<bool, List<Product>> _createOrder;

  void createOrder(CreateOrderState createorderState) async {
    final listProducts = createorderState as CreateOrderStateInProgessing;
    emit(createorderState);
    final _result = await _createOrder(listProducts.productList);
    _result.fold(
      (error) => emit(CreateOrderStateError()),
      (complete) => emit(CreateOrderStateComplete()),
    );
  }
}
