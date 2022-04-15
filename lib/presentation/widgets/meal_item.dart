import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funduk_app/bussines_logic/cubits/cart_dart_cubit.dart';
import 'package:funduk_app/bussines_logic/cubits/counter_dart_cubit.dart';
import 'package:funduk_app/bussines_logic/cubits/dummy_meals_cubit.dart';
import 'package:funduk_app/presentation/screens/details_screen.dart';

import '../../data/models/cart.dart';

class MealItem extends StatefulWidget {
  Color color;
  String imageUrl;
  int countIng;
  double price;
  String title;
  String typeMeal;
  List<String> ingriedents;
  String subType;
  String description;
  String videoId;
  int id;

  MealItem({
    Key? key,
    required this.id,
    required this.color,
    required this.imageUrl,
    required this.countIng,
    required this.price,
    required this.typeMeal,
    required this.title,
    required this.ingriedents,
    required this.subType,
    required this.description,
    required this.videoId,
  }) : super(key: key);

  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  bool _visibleDialog = false;
  var rnd = Random();
  AnimationController? controller;
  Animation<double>? scaleAnimation;

  @override
  Widget build(BuildContext context) {
    int counter = 0;
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
                      Text('${widget.title} ${"add".tr()}',textAlign: TextAlign.center,)
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
                      '${widget.price.toStringAsFixed(0)} ${"money".tr()}',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 200,
                      height: 100,
                      child: Image.asset(
                        widget.imageUrl,
                        fit: BoxFit.contain,
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
                                _visibleDialog = !_visibleDialog;
                              });
                              BlocProvider.of<CounterDartCubit>(context)
                                  .state
                                  .counter!=0?BlocProvider.of<CartDartCubit>(context)
                                  .addList(Cart(
                                id: DateTime.now().toString(),
                                title: widget.title,
                                imageUrl: widget.imageUrl,
                                typeMeal: widget.typeMeal,
                                count:
                                    BlocProvider.of<CounterDartCubit>(context)
                                        .state
                                        .counter
                                        .toInt(),
                                price: widget.price,
                                videoId: widget.videoId,
                              )):Container();
                              BlocProvider.of<CounterDartCubit>(context)
                                  .doNull();
                              BlocProvider.of<CartDartCubit>(context)
                                  .sumOfPrices();
                              BlocProvider.of<CartDartCubit>(context)
                                  .countItems();
                              Navigator.of(context).pop();
                              // BlocProvider.of<CounterDartCubit>(context).doNull();
                              BlocProvider.of<CounterDartCubit>(context)
                                  .state
                                  .counter==0?_showMaterialDialogCheck():Container();
                            },
                            child: Text(
                              "add_to_cart".tr(),
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
                SizedBox(
                  height: widget.countIng != 0 ? 60 : 70,
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
                      "cost".tr(),
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
                widget.countIng != 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.food_bank_outlined,
                            color: Colors.black.withOpacity(.8),
                            size: 14,
                          ),
                          Text(
                            '${widget.countIng.toString()} ${"ing".tr()}',
                            style: TextStyle(
                                color: Colors.black.withOpacity(.8),
                                fontSize: 14),
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: widget.ingriedents.length > 0
                      ? MainAxisAlignment.spaceEvenly
                      : MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: const Icon(
                            Icons.add_circle_outline_outlined,
                            color: Colors.blue,
                            size: 18,
                          ),
                          onPressed: () {
                            _showMaterialDialog();
                          },
                        ),
                      ),
                      width: widget.ingriedents.length > 0 ? 38 : 55,
                      height: widget.ingriedents.length > 0 ? 38 : 55,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: widget.ingriedents.length > 0
                            ? BorderRadius.circular(5)
                            : BorderRadius.circular(20),
                      ),
                    ),
                    widget.ingriedents.length > 0
                        ? SizedBox(
                            width: 10,
                          )
                        : SizedBox(),
                    widget.ingriedents.length > 0
                        ? ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<DummyMealsCubit>(context)
                                  .findById(widget.id);
                              Navigator.of(context)
                                  .pushNamed(DetailsScreen.routeArgs);
                            },
                            child: Text(
                              "more".tr(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ))
                        : SizedBox()
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: widget.countIng != 0 ? 100 : 90,
              height: widget.countIng != 0 ? 100 : 120,
              child: Image.asset(
                widget.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
        )
      ],
    );
  }
}
