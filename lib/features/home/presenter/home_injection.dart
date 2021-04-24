import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_juan/features/home/data/data.dart';
import 'package:prueba_tecnica_juan/features/home/data/repository/home_repository.dart';
import 'package:prueba_tecnica_juan/features/home/domain/domain.dart';
import 'package:prueba_tecnica_juan/features/home/external/external.dart';
import 'package:prueba_tecnica_juan/features/home/presenter/bloc/bloc.dart';
import 'package:prueba_tecnica_juan/features/home/presenter/ui/home_page.dart';

class HomeInjection extends StatelessWidget {
  const HomeInjection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HomeDataSource>(
          create: (context) => MockExternal(),
        ),
        RepositoryProvider<HomeRepositories>(
          create: (context) => HomeRepositoryImpl(
            context.read<HomeDataSource>(),
          ),
        ),
        RepositoryProvider<GetProducts>(
          create: (context) => GetProductsImpl(
            context.read<HomeRepositories>(),
          ),
        ),
      ],
      child: BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc(
          context.read<GetProducts>(),
        )..add(
            LoadDataEvent(),
          ),
        child: const HomePage(),
      ),
    );
  }
}
