import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica_juan/cubit_main/cubit_main.dart';
import 'package:prueba_tecnica_juan/features/home/presenter/presenter.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ObjectInCartCubit>(
      create: (context) => ObjectInCartCubit(),
      child: const MaterialApp(
        home: HomeInjection(
          key: Key('HomeInjection'),
        ),
      ),
    );
  }
}
