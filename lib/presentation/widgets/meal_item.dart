import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funduk_app/bussines_logic/cubits/cart_dart_cubit.dart';
import 'package:funduk_app/bussines_logic/cubits/counter_dart_cubit.dart';
import 'package:funduk_app/presentation/screens/details_screen.dart';

import '../../data/models/cart.dart';

class MealItem extends StatefulWidget {
  Color color;
  String imageUrl;
  int countIng;
  double price;
  String title;
  String typeMeal;

  MealItem(
      {Key? key,
      required this.color,
      required this.imageUrl,
      required this.countIng,
      required this.price,
      required this.typeMeal,
      required this.title})
      : super(key: key);

  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  bool _visibleDialog = false;
  AnimationController? controller;
  Animation<double>? scaleAnimation;

  @override
  Widget build(BuildContext context) {
    int counter =0;
    void _showMaterialDialogCheck() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              alignment: Alignment.centerRight,
              elevation: 0,
              backgroundColor: Colors.grey.withOpacity(0),
              actionsAlignment: MainAxisAlignment.center,
              title: AnimatedOpacity(
                curve: Curves.bounceInOut,
                duration: const Duration(milliseconds: 1000),
                opacity: _visibleDialog ? 1.0 : 0.0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/images/circle.svg',
                            height: 120,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            width: 135,
                            height: 100,
                            alignment: Alignment.topRight,
                            child: SvgPicture.asset(
                              'assets/images/check.svg',
                              height: 90,
                              width: 90,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text('${widget.title} добавлен!')
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * .4,
                  height: MediaQuery.of(context).size.height * .4,
                ),
              ),
              actions: <Widget>[
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _visibleDialog = !_visibleDialog;
                        });
                        Navigator.of(context).pop();
                      },
                      child: SvgPicture.asset(
                        'assets/images/cancel.svg',
                        height: 16,
                        color: Colors.indigo,
                      ),
                    ))
              ],
            );
          });
    }

    void _showMaterialDialog() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              alignment: Alignment.centerRight,
              elevation: 0,
              backgroundColor: Colors.grey.withOpacity(0),
              actionsAlignment: MainAxisAlignment.center,
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Text(
                      widget.title,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${widget.price.toStringAsFixed(0)} сум',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 200,
                      height: 100,
                      child: Image.asset(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.indigo),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                              onPressed: () {
                                BlocProvider.of<CounterDartCubit>(context)
                                    .increment();
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 16,
                              )),
                          BlocBuilder<CounterDartCubit, CounterState>(
                            builder: (context, state) {
                              return Text(
                                state.counter.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              );
                            },
                          ),
                          IconButton(
                              onPressed: () {
                                BlocProvider.of<CounterDartCubit>(context)
                                    .decrement();
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 16,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 16,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                counter=BlocProvider.of<CounterDartCubit>(context).state.counter.toInt();
                                _visibleDialog = !_visibleDialog;
                              });

                              BlocProvider.of<CartDartCubit>(context).addList(
                                  Cart(
                                      id: DateTime.now().toString(),
                                      title: widget.title,
                                      imageUrl: widget.imageUrl,
                                      typeMeal: widget.typeMeal,
                                      count: counter,
                                      price: widget.price));
                              BlocProvider.of<CounterDartCubit>(context).doNull();
                              Navigator.of(context).pop();

                              _showMaterialDialogCheck();
                              // BlocProvider.of<CounterDartCubit>(context).doNull();
                            },
                            child: const Text(
                              'Добавит в меню',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: SvgPicture.asset(
                        'assets/images/cancel.svg',
                        height: 16,
                        color: Colors.indigo,
                      ),
                    ))
              ],
            );
          });
    }

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          width: width * 0.4,

          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 0,
              spreadRadius: 0,
              color: Colors.white,
            ),
          ]),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.all(5),
            width: width * .4,
            height: height * .30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: widget.color,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.grey.withOpacity(.25),
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  )
                ]),
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 60,
                ),
                Text(
                  '| ${widget.typeMeal}',
                  style: const TextStyle(color: Colors.blue, fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'стоимость:',
                      style: TextStyle(
                          color: Colors.black.withOpacity(.8), fontSize: 12),
                    ),
                    Text(
                      widget.price.toStringAsFixed(0),
                      style: TextStyle(
                          color: Colors.black.withOpacity(.8), fontSize: 12),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.food_bank_outlined,
                      color: Colors.black.withOpacity(.8),
                      size: 14,
                    ),
                    Text(
                      '${widget.countIng.toString()} инг',
                      style: TextStyle(
                          color: Colors.black.withOpacity(.8), fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: const Icon(
                            Icons.add_circle_outline_outlined,
                            color: Colors.blue,
                            size: 15,
                          ),
                          onPressed: () {
                            _showMaterialDialog();
                          },
                        ),
                      ),
                      width: 28,
                      height: 38,
                      padding: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(DetailsScreen.routeArgs);
                        },
                        child: const Text(
                          'Подробнее',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: height * .2,
          left: 20,
          child: Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: 150,
              height: 150,
              child: Image.asset(
                widget.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
}
