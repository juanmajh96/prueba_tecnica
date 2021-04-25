import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_tecnica_juan/features/home/presenter/presenter.dart';

void main() {
  Key _keyHomeInjection;
  setUp(() {
    _keyHomeInjection = const Key('HomeInjection');
  });

  testWidgets('renders HomeInjection', (tester) async {
    HomeInjection(
      key: _keyHomeInjection,
    );
  });
}
