part of 'createorder_cubit.dart';

abstract class CreateOrderState extends Equatable {
  const CreateOrderState();

  @override
  List<Object> get props => [];
}

class CreateOrderStateInitial extends CreateOrderState {}

class CreateOrderStateInProgessing extends CreateOrderState {
  CreateOrderStateInProgessing(this.productList);
  final List<Product> productList;

  @override
  List<Object> get props => [productList];

  @override
  bool get stringify => true;
}

class CreateOrderStateComplete extends CreateOrderState {}

class CreateOrderStateError extends CreateOrderState {}
