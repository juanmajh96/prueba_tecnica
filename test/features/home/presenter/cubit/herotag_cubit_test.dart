import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_tecnica_juan/features/home/presenter/cubit/cubit.dart';

void main() {
  HeroTagCubit _cubit;
  setUp(() {
    _cubit = HeroTagCubit();
  });

  blocTest(
    'Emits String when changeHeroTag is called ',
    build: () => _cubit,
    act: (HeroTagCubit bloc) => bloc.changeHeroTag('Cart'),
    expect: ['Cart'],
  );
}
