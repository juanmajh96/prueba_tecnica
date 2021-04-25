import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_tecnica_juan/features/home/presenter/cubit/cubit.dart';

void main() {
  QuantityCubit _cubit;
  setUp(() {
    _cubit = QuantityCubit();
  });

  blocTest(
    'Emits int when addAmount is called ',
    build: () => _cubit,
    act: (QuantityCubit cubit) => cubit.addAmount(),
    expect: [2],
  );

  blocTest(
    'Emits int when addAmount is called ',
    build: () {
      _cubit.addAmount();
      return _cubit;
    },
    act: (QuantityCubit cubit) => cubit.subtractAmount(),
    expect: [1],
  );
}
