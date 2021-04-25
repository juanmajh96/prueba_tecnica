part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class AddProductEvent extends DetailsEvent {
  AddProductEvent({@required this.product});
  final Product product;
}