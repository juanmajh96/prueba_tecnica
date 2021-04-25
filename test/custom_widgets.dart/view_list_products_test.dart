import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';
import 'package:prueba_tecnica_juan/custom_widgets.dart/view_list_products.dart';
import 'package:network_image_mock/network_image_mock.dart';
import '../helpers/helpers.dart';

void main() {
  testWidgets('view list products ...', (tester) async {
    await mockNetworkImagesFor(
      () => tester.pumpApp(
        Row(
          children: [
            ViewListProducts(
              item: Product(
                name: 'test',
                quantity: Quantity(1),
                urlImage: '',
              ),
            ),
          ],
        ),
      ),
    );

    final name = find.text('test');
    final quantity = find.text('1');

    expect(name, findsOneWidget);
    expect(quantity, findsOneWidget);
  });
}
