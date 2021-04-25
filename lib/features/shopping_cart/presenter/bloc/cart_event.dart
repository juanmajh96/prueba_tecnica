part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadDataEvent extends CartEvent {}

class UpdateDataEvent extends CartEvent {
  UpdateDataEvent({@required this.product});
  final Product product;
}

class DeleteEvent extends CartEvent {
  DeleteEvent({@required this.product});
  final Product product;
}

class CreateOrderEvent extends CartEvent {
  CreateOrderEvent({@required this.productList});
  final List<Product> productList;
}
