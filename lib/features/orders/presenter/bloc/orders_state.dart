part of 'orders_bloc.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();
}

class OrdersLoadingState extends OrdersState {
  @override
  List<Object> get props => null;
}

class OrdersCompleteState extends OrdersState {
  OrdersCompleteState(this.orders);
  final List<Orders> orders;

  @override
  List<Object> get props => [orders];

  @override
  bool get stringify => true;
}

class OrdersErrorState extends OrdersState {
  @override
  List<Object> get props => null;
}

class OrdersNotInternetState extends OrdersState {
  @override
  List<Object> get props => null;
}
