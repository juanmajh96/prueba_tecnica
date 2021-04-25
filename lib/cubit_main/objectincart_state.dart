part of 'objectincart_cubit.dart';

abstract class ObjectInCartState extends Equatable {
  const ObjectInCartState();

  @override
  List<Object> get props => [];
}

class ObjectInCartInitial extends ObjectInCartState {}

class ObjectInCartAdded extends ObjectInCartState {
  ObjectInCartAdded(this.urlImage, this.id);
  final String urlImage;
  final String id;
}
