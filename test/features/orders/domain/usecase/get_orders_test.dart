import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba_tecnica_juan/features/orders/domain/domain.dart';

class OrdersRepositoriesMock extends Mock implements OrdersRepositories {}

void main() {
  OrdersRepositoriesMock _repositories;
  GetOrdersImpl _usecases;
  setUp(() {
    _repositories = OrdersRepositoriesMock();
    _usecases = GetOrdersImpl(_repositories);
  });

  test('It should return Product list if It work good', () async {
    when(_repositories.getOrders()).thenAnswer(
      (_) async => const Right(<Orders>[]),
    );

    final _result = await _usecases();

    expect(_result, const Right(<Orders>[]));
    verify(_repositories.getOrders()).called(1);
  });

  test('It should return HomeError if It not work good ', () {
    when(_repositories.getOrders()).thenThrow(OrdersErrors());

    final _result = _usecases();

    expect(
      _result,
      throwsA(
        isA<OrdersErrors>(),
      ),
    );
  });
}
