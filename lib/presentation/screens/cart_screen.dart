import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funduk_app/presentation/widgets/cart_item.dart';
import 'package:funduk_app/presentation/widgets/main_drawer.dart';

import '../../bussines_logic/cubits/cart_dart_cubit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeArgs = '/cart_screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          MainDrawer(color: Colors.indigo),
          Container(
            width: MediaQuery.of(context).size.width * .8,
            child: BlocBuilder<CartDartCubit, CartDartInitial>(
                builder: (context, state) {
              return Container(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return CartItem(
                          id: DateTime.now().toString(),
                          title: state.list[index].title,
                          imageUrl: state.list[index].imageUrl,
                          typeMeal: state.list[index].typeMeal,
                          count: state.list[index].count,
                          price: state.list[index].price);
                    },
                    itemCount: state.list.length,
                  ));
            }),
          ),
        ],
      ),
    );
  }
}
