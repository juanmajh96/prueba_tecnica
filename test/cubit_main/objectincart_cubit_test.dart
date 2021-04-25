import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_tecnica_juan/cubit_main/cubit_main.dart';

void main() {
  ObjectInCartCubit _cubit;
  ObjectInCartInitial _stateInitial;
  setUp(() {
    _stateInitial = ObjectInCartInitial();
    _cubit = ObjectInCartCubit();
  });

  test('Check initial state cubit', () {
    expect(_cubit.state, _stateInitial);
  });
  blocTest(
    'Emits ObjectInCartAdded when changeWidget is called ',
    build: () => _cubit,
    act: (ObjectInCartCubit bloc) => bloc.changeWidget(
      ObjectInCartAdded('any', 'any'),
    ),
    expect: [
      ObjectInCartAdded('any', 'any'),
    ],
  );
}
