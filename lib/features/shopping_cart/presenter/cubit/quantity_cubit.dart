import 'package:bloc/bloc.dart';

class QuantityCubit extends Cubit<bool> {
  QuantityCubit() : super(false);

  Future<void> setValue() async {
    emit(true);
    emit(false);
  }
}
