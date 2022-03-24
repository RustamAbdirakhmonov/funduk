import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funduk_app/presentation/screens/my_home_page.dart';
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
              return state.list.length > 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .8,
                                    height: MediaQuery.of(context).size.height *
                                        .08,
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 15),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Ваше корзина',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            BlocProvider.of<CartDartCubit>(
                                                    context)
                                                .removeList();
                                          },
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.delete_outline_outlined,
                                                color: Colors.red,
                                              ),
                                              Text(
                                                'Стереть корзину',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                          style: ButtonStyle(),
                                        )
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                    ),
                                  ),
                                  Container(
                                    child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        return CartItem(
                                            id: state.list[index].id,
                                            title: state.list[index].title,
                                            imageUrl:
                                                state.list[index].imageUrl,
                                            typeMeal:
                                                state.list[index].typeMeal,
                                            count: state.list[index].count,
                                            price: state.list[index].price);
                                      },
                                      itemCount: state.list.length,
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * .8,
                                    height: MediaQuery.of(context).size.height *
                                        .92,
                                  ),
                                ],
                              ),
                              Container(

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: <Widget>[
                                       Text('Итого сумма:',style: TextStyle(color: Colors.black.withOpacity(.6)),),
                                       BlocBuilder<CartDartCubit,
                                           CartDartInitial>(
                                         builder: (context, state) {
                                           print(state.sum);
                                           return Text(' ${
                                               state.sum.toStringAsFixed(0)
                                           }',style: TextStyle(color: Colors.black.withOpacity(.6)),);
                                         },
                                       ),
                                     ],
                                   ),
                                    SizedBox(height: 3,),
                                    Divider(color: Colors.grey,height: 2),
                                    SizedBox(height: 3,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Количество:',style: TextStyle(color: Colors.black.withOpacity(.6))),
                                        BlocBuilder<CartDartCubit,CartDartInitial>(builder: (context, state){
                                          return Text(state.countMeals.toStringAsFixed(0),style: TextStyle(color: Colors.black.withOpacity(.6)));
                                        }),
                                      ],
                                    )

                                  ],
                                ),
                                color: Colors.blueAccent.withOpacity(.4),
                              )
                            ],
                            alignment: Alignment.bottomRight,
                          )
                        ])
                  : Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Your cart is empty \n please choose meal\n from the menu',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(MyHomePage.routeArgs);
                              },
                              child: Text(
                                'Меню',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.indigo)),
                            )
                          ],
                        ),
                      ),
                    );
            }),
          )
        ],
      ),
    );
  }
}
