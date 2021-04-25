import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';
import 'package:prueba_tecnica_juan/features/orders/orders.dart';

class GetOrdersMock extends Mock implements GetOrders<List<Orders>> {}

void main() {
  GetOrdersMock _usecase;
  OrdersBloc _ordersBloc;
  List<Orders> _listOrders;

  setUp(
    () {
      _usecase = GetOrdersMock();
      _ordersBloc = OrdersBloc(
        _usecase,
      );
      _listOrders = <Orders>[
        Orders(
          listProduct: [
            Product(description: '', id: '1', name: '', sku: '', urlImage: ''),
          ],
          name: Timestamp(2, 2),
        )
      ];
    },
  );

  blocTest(
    'Emits [OrdersCompleteState] when usecase reeturn list orders ',
    build: () {
      when(_usecase()).thenAnswer((_) async => Right(_listOrders));
      return _ordersBloc;
    },
    act: (OrdersBloc bloc) => bloc.add(LoadDataEvent()),
    expect: [
      OrdersLoadingState(),
      OrdersCompleteState(
        <Orders>[
          Orders(
            listProduct: [
              Product(
                  description: '', id: '1', name: '', sku: '', urlImage: ''),
            ],
            name: Timestamp(2, 2),
          )
        ],
      ),
    ],
  );

  group('when its unsuccessful', () {
    blocTest(
      'Emits [HomeNotInternetState] when there are not internet ',
      build: () {
        when(_usecase()).thenAnswer((_) async => Left(NotConnection()));
        return _ordersBloc;
      },
      act: (OrdersBloc bloc) => bloc.add(LoadDataEvent()),
      expect: [
        OrdersLoadingState(),
        OrdersNotInternetState(),
      ],
    );

    blocTest(
      'Emits [HomeNotInternetState] when there are not internet ',
      build: () {
        when(_usecase()).thenAnswer((_) async => Left(DefaultError()));
        return _ordersBloc;
      },
      act: (OrdersBloc bloc) => bloc.add(LoadDataEvent()),
      expect: [
        OrdersLoadingState(),
        OrdersErrorState(),
      ],
    );
  });
}
