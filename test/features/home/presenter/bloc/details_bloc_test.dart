import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba_tecnica_juan/features/home/home.dart';

import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';

class AddProductMock extends Mock implements AddProductImpl {}

void main() {
  AddProductMock _usecase;
  DetailsBloc _detailsBloc;
  Product _product;

  setUp(() {
    _usecase = AddProductMock();
    _detailsBloc = DetailsBloc(
      _usecase,
    );
    _product =
        Product(description: '', id: '1', name: '', sku: '', urlImage: '');
  });

  group(
    'when its successfull',
    () {
      test(
        'Emits [DetailsInitial] when usecase reeturn list products',
        () {
          when(_usecase(any)).thenAnswer((_) async => const Right(true));

          expectLater(
            _detailsBloc,
            emitsInOrder(
              [
                DetailsLoading(),
                DetailsInitial(),
              ],
            ),
          );

          _detailsBloc.add(AddProductEvent(product: _product));
        },
      );

      blocTest(
        'Emits [DetailsInitial] when usecase reeturn list products ',
        build: () {
          when(_usecase(any)).thenAnswer((_) async => const Right(true));
          return _detailsBloc;
        },
        act: (DetailsBloc bloc) => bloc.add(AddProductEvent(product: _product)),
        expect: [
          DetailsLoading(),
          DetailsInitial(),
        ],
      );
    },
  );

  group('when its unsuccessful', () {
    blocTest(
      'Emits [DetailsNotInternetState] when there are not internet ',
      build: () {
        when(_usecase(any)).thenAnswer((_) async => Left(NotConnection()));
        return _detailsBloc;
      },
      act: (DetailsBloc bloc) => bloc.add(AddProductEvent(product: _product)),
      expect: [
        DetailsLoading(),
        DetailsNotInternetState(),
      ],
    );

    blocTest(
      'Emits [DetailsErrorState] when there are not internet ',
      build: () {
        when(_usecase(any)).thenAnswer((_) async => Left(DefaultError()));
        return _detailsBloc;
      },
      act: (DetailsBloc bloc) => bloc.add(AddProductEvent(product: _product)),
      expect: [
        DetailsLoading(),
        DetailsErrorState(),
      ],
    );
  });
}
