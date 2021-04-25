import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_juan/core/domain/entities/entities.dart';
import 'package:prueba_tecnica_juan/custom_widgets.dart/view_list_products.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/presenter/bloc/bloc.dart';
import 'package:prueba_tecnica_juan/features/shopping_cart/presenter/cubit/cubit.dart';

class CartList extends StatelessWidget {
  const CartList({Key key, @required this.listProduct}) : super(key: key);

  final List<Product> listProduct;

  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context, listen: false);
    final _refresCubit = BlocProvider.of<QuantityCubit>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: BlocBuilder<QuantityCubit, bool>(
              builder: (context, state) => ListView.builder(
                itemCount: listProduct.length,
                itemBuilder: (context, index) {
                  final item = listProduct[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      children: [
                        ViewListProducts(
                          item: item,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[200],
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                iconSize: 20,
                                padding: const EdgeInsets.all(1),
                                onPressed: () {
                                  if (item.quantity.quantity > 1) {
                                    item.quantity.quantity =
                                        item.quantity.quantity - 1;
                                    _refresCubit.setValue();
                                    _cartBloc.add(
                                      UpdateDataEvent(product: item),
                                    );
                                  }
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                iconSize: 20,
                                padding: const EdgeInsets.all(1),
                                onPressed: () {
                                  item.quantity.quantity =
                                      item.quantity.quantity + 1;
                                  _refresCubit.setValue();
                                  _cartBloc.add(
                                    UpdateDataEvent(product: item),
                                  );
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            listProduct
                                .removeWhere((itemL) => itemL.id == item.id);
                            _refresCubit.setValue();
                            _cartBloc.add(
                              DeleteEvent(product: item),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
            child: RaisedButton(
              color: const Color(0xFFF4C459),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {
                _cartBloc.add(
                  CreateOrderEvent(productList: listProduct),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'Crear orden',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
