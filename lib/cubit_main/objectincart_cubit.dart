import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'objectincart_state.dart';

class ObjectInCartCubit extends Cubit<ObjectInCartState> {
  ObjectInCartCubit() : super(ObjectInCartInitial());

  void changeWidget(ObjectInCartState objectInCartState) {
    emit(objectInCartState);
  }
}
