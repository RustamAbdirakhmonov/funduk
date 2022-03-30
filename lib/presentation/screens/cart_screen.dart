import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funduk_app/bussines_logic/cubits/counter_dart_cubit.dart';
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
                                          "cart".tr(),
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
                                                "remove_cart".tr(),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "cash".tr(),
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(.6)),
                                        ),
                                        BlocBuilder<CartDartCubit,
                                            CartDartInitial>(
                                          builder: (context, state) {
                                            print(state.sum);
                                            return Text(
                                              ' ${state.sum.toStringAsFixed(0)}',
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(.6)),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Divider(color: Colors.grey, height: 2),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("quantity".tr(),
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(.6))),
                                        BlocBuilder<CartDartCubit,
                                                CartDartInitial>(
                                            builder: (context, state) {
                                          return Text(
                                              state.countMeals
                                                  .toStringAsFixed(0),
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(.6)));
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
                            SizedBox(
                              child: Text(
                                "notify".tr(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              width: MediaQuery.of(context).size.width * .5,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(MyHomePage.routeArgs);
                                BlocProvider.of<CounterDartCubit>(context)
                                    .setNavRailIndex(0);
                              },
                              child: Text(
                                'menu'.tr(),
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
