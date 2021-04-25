part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoadingState extends CartState {}

class CartCompleteState extends CartState {
  CartCompleteState(this.products);
  final List<Product> products;

  @override
  List<Object> get props => [products];

  @override
  bool get stringify => true;
}

class OrderCreated extends CartState {}

class CartErrorState extends CartState {}

class CartNotInternetState extends CartState {}
