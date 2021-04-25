import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_tecnica_juan/app/app.dart';
import 'package:prueba_tecnica_juan/features/home/presenter/presenter.dart';

void main() {
  Key _keyApp;
  setUp(() {
    _keyApp = const Key('App');
  });
  group('Main', () {
    testWidgets('renders HomeInjection', (tester) async {
      await tester.pumpWidget(
        App(
          key: _keyApp,
        ),
      );
      expect(find.byType(HomeInjection), findsOneWidget);
      expect(find.byKey(_keyApp), findsOneWidget);
    });
  });
}
