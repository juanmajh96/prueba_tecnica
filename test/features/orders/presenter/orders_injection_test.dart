import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_tecnica_juan/features/orders/presenter/presenter.dart';

void main() {
  Key _key;
  setUp(() {
    _key = const Key('OrdersInjection');
  });

  testWidgets('renders OrdersPage', (tester) async {
    OrdersInjection(
      key: _key,
    );
  });
}
