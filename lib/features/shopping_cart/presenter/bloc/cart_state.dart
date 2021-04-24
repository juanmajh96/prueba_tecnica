part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class HomeLoadingState extends CartState {
  @override
  List<Object> get props => null;
}

class HomeCompleteState extends CartState {
  HomeCompleteState(this.products);
  final List<Product> products;

  @override
  List<Object> get props => [products];

  @override
  bool get stringify => true;
}

class HomeErrorState extends CartState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class HomeNotInternetState extends CartState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
