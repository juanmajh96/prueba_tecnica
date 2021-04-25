import 'package:bloc/bloc.dart';

class QuantityCubit extends Cubit<int> {
  QuantityCubit() : super(1);

  void addAmount() => emit(state + 1);

  void subtractAmount() {
    if (state > 1) {
      emit(state - 1);
    }
  }
}
