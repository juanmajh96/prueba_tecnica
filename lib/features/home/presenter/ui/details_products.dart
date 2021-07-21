import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prueba_tecnica_juan/core/domain/entities/product.dart';
import 'package:prueba_tecnica_juan/cubit_main/cubit_main.dart';
import 'package:prueba_tecnica_juan/features/home/domain/domain.dart';
import 'package:prueba_tecnica_juan/features/home/presenter/bloc/bloc.dart';
import 'package:prueba_tecnica_juan/features/home/presenter/cubit/cubit.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    Key key,
    @required this.product,
    @required this.homeRepositories,
  }) : super(key: key);
  final Product product;
  final HomeRepositories homeRepositories;

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AddProduct>(
      create: (context) => AddProductImpl(widget.homeRepositories),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<DetailsBloc>(
            create: (context) => DetailsBloc(
              context.read<AddProduct>(),
            ),
          ),
          BlocProvider<HeroTagCubit>(
            create: (context) => HeroTagCubit(),
          ),
          BlocProvider<QuantityCubit>(
            create: (context) => QuantityCubit(),
          )
        ],
        child: Scaffold(
          appBar: AppBar(
            leading: const BackButton(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: BlocBuilder<HeroTagCubit, String>(
                              builder: (context, state) {
                                return Hero(
                                  tag: 'list_${widget.product.id}$state',
                                  child: Image.network(
                                    widget.product.urlImage,
                                    fit: BoxFit.contain,
                                    height: MediaQuery.of(context).size.height *
                                        0.36,
                                  ),
                                );
                              },
                            ),
                          ),
                          Text(
                            widget.product.name,
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.grey[200],
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final _quantityCubit =
                                        BlocProvider.of<QuantityCubit>(context,
                                            listen: false);
                                    return BlocBuilder<QuantityCubit, int>(
                                      builder: (context, quantity) {
                                        return Row(
                                          children: [
                                            const SizedBox(width: 10),
                                            IconButton(
                                              onPressed:
                                                  _quantityCubit.subtractAmount,
                                              icon: const Icon(
                                                Icons.remove,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20.0),
                                              child: Text(
                                                quantity.toString(),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed:
                                                  _quantityCubit.addAmount,
                                              icon: const Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Acerca del producto',
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.product.description,
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w200,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 6,
                        child: BlocConsumer<DetailsBloc, DetailsState>(
                          listener: (context, state) async {
                            final _objectInCartCubit =
                                BlocProvider.of<ObjectInCartCubit>(context,
                                    listen: false);
                            if (state is DetailsInitial) {
                              _objectInCartCubit.changeWidget(
                                ObjectInCartAdded(
                                    widget.product.urlImage, widget.product.id),
                              );
                              await Future.delayed(
                                  const Duration(milliseconds: 100));
                              Navigator.of(context).pop();
                            }
                          },
                          builder: (context, state) {
                            final _heroTag = BlocProvider.of<HeroTagCubit>(
                              context,
                              listen: false,
                            );

                            final _quantityCubit =
                                BlocProvider.of<QuantityCubit>(context,
                                    listen: false);
                            final _detailsBloc = BlocProvider.of<DetailsBloc>(
                                context,
                                listen: false);
                            return state is DetailsLoading
                                ? RaisedButton(
                                    color: const Color(0xFFF4C459),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    onPressed: () {},
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15.0),
                                      child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  )
                                : RaisedButton(
                                    color: const Color(0xFFF4C459),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    onPressed: () {
                                      _heroTag.changeHeroTag('Cart');

                                      widget.product.quantity.quantity =
                                          widget.product.quantity.quantity +
                                              _quantityCubit.state;

                                      _detailsBloc.add(
                                        AddProductEvent(
                                            product: widget.product),
                                      );
                                    },
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15.0),
                                      child: Text(
                                        'Agregar al carrito',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
