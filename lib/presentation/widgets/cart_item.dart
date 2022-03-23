import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funduk_app/bussines_logic/cubits/cart_dart_cubit.dart';
import 'package:funduk_app/bussines_logic/cubits/counter_dart_cubit.dart';

class CartItem extends StatefulWidget {
  CartItem(
      {Key? key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.typeMeal,
      required this.count,
      required this.price})
      : super(key: key);
  String id;
  String title;
  String imageUrl;
  String typeMeal;
  int count;
  double price;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(6),
      padding: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width * .8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 6,
          ),
          Container(
            width: 60,
            height: 60,
            child: FittedBox(
              child: Image.asset(
                widget.imageUrl,
                fit: BoxFit.fill,
              ),
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .52,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.title,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.typeMeal,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Text(
                      '${widget.price.toString()} сум',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    )
                  ],
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          print(widget.id);
                          BlocProvider.of<CartDartCubit>(context).incrementCart(widget.count,widget.id);
                        },
                        icon: Container(
                          child: Icon(Icons.add),
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        color: Colors.white,
                        iconSize: 24,
                      ),
                      BlocBuilder<CounterDartCubit, CounterState>(
                        builder: (context, state) {
                          return Text(
                            (widget.count).toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                          );
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<CartDartCubit>(context).decrementCart(widget.count,widget.id);

                        },
                        icon: Container(
                          child: Icon(Icons.remove),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        color: Colors.white,
                        iconSize: 24,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
