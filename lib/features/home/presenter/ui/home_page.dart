import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_juan/features/home/presenter/bloc/bloc.dart';

import 'card_products.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              height: 200,
            )
          ],
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeCompleteState) {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.products.length,
              itemBuilder: (context, index) => CardProducts(
                product: state.products[index],
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                childAspectRatio: 0.8,
              ),
            );
          } else if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeNotInternetState) {
            return const Center(
              child: Text('no hay internet'),
            );
          } else {
            return const Center(
              child: Text(
                  'trabamos continuamente para minimizar estas situaciones'),
            );
          }
        },
      ),
    );
  }
}
