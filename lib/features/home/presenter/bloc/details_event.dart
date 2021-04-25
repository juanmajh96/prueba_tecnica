part of 'details_bloc.dart';

abstract class DetailsEvent {
  const DetailsEvent();
}

class AddProductEvent extends DetailsEvent {
  AddProductEvent({@required this.product});
  final Product product;
}
