part of 'orders_bloc.dart';

abstract class OrdersEvent {
  const OrdersEvent();
}

class LoadDataEvent extends OrdersEvent {}
