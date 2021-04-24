import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba_tecnica_juan/features/home/home.dart';

import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';

class GetProductsMock extends Mock implements GetProductsImpl {}

void main() {
  GetProductsMock _usecase;
  HomeBloc _homeBloc;
  List<Product> _listProduct;

  setUp(() {
    _usecase = GetProductsMock();
    _homeBloc = HomeBloc(_usecase);
    _listProduct = <Product>[
      Product(description: '', id: 1, name: '', sku: '', urlImage: '')
    ];
  });

  group(
    'when its successfull',
    () {
      test(
        'Emits [HomeCompleteState] when usecase reeturn list products',
        () {
          when(_usecase()).thenAnswer((_) async => Right(_listProduct));

          expectLater(
            _homeBloc,
            emitsInOrder(
              [
                HomeLoadingState(),
                HomeCompleteState(_listProduct),
              ],
            ),
          );

          _homeBloc.add(LoadDataEvent());
        },
      );

      blocTest(
        'Emits [HomeCompleteState] when usecase reeturn list products ',
        build: () {
          when(_usecase()).thenAnswer((_) async => Right(_listProduct));
          return _homeBloc;
        },
        act: (HomeBloc bloc) => bloc.add(LoadDataEvent()),
        expect: [
          HomeLoadingState(),
          HomeCompleteState(
            <Product>[
              Product(description: '', id: 1, name: '', sku: '', urlImage: '')
            ],
          ),
        ],
      );
    },
  );

  group('when its unsuccessful', () {
    blocTest(
      'Emits [HomeNotInternetState] when there are not internet ',
      build: () {
        when(_usecase()).thenAnswer((_) async => Left(NotConnection()));
        return _homeBloc;
      },
      act: (HomeBloc bloc) => bloc.add(LoadDataEvent()),
      expect: [
        HomeLoadingState(),
        HomeNotInternetState(),
      ],
    );

    blocTest(
      'Emits [HomeNotInternetState] when there are not internet ',
      build: () {
        when(_usecase()).thenAnswer((_) async => Left(DefaultError()));
        return _homeBloc;
      },
      act: (HomeBloc bloc) => bloc.add(LoadDataEvent()),
      expect: [
        HomeLoadingState(),
        HomeErrorState(),
      ],
    );
  });
}
