import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:funduk_app/bussines_logic/cubits/cart_dart_cubit.dart';

class CartItem extends StatefulWidget {
  CartItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.typeMeal,
    required this.count,
    required this.price,
  }) : super(key: key);
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
  void removeItem(BuildContext context) {
    BlocProvider.of<CartDartCubit>(context).removieItem(widget.id);
    BlocProvider.of<CartDartCubit>(context).countItems();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(left: 6, right: 6, bottom: 6),
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
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: (){

              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .52,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          child: Text(
                            widget.title,
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          height: 40,
                        ),
                        Text(
                          widget.typeMeal,
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Text(
                          '${widget.price.toStringAsFixed(0)} сум',
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
                              BlocProvider.of<CartDartCubit>(context)
                                  .incrementCart(
                                      BlocProvider.of<CartDartCubit>(context)
                                          .state
                                          .list[BlocProvider.of<CartDartCubit>(
                                                  context)
                                              .state
                                              .list
                                              .indexWhere((element) =>
                                                  element.id == widget.id)]
                                          .count,
                                      widget.id);
                              BlocProvider.of<CartDartCubit>(context).sumOfPrices();
                              BlocProvider.of<CartDartCubit>(context).countItems();

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
                          BlocBuilder<CartDartCubit, CartDartInitial>(
                            builder: (context, state) {
                              return Text(
                                state
                                    .list[state.list.indexWhere(
                                        (element) => element.id == widget.id)]
                                    .count
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800),
                              );
                            },
                          ),
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<CartDartCubit>(context)
                                  .decrementCart(
                                      BlocProvider.of<CartDartCubit>(context)
                                          .state
                                          .list[BlocProvider.of<CartDartCubit>(
                                                  context)
                                              .state
                                              .list
                                              .indexWhere((element) =>
                                                  element.id == widget.id)]
                                          .count,
                                      widget.id);
                              BlocProvider.of<CartDartCubit>(context).sumOfPrices();
                              BlocProvider.of<CartDartCubit>(context).countItems();

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
              ),
            )
          ],
        ),
      ),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: removeItem,
            backgroundColor: Colors.white.withOpacity(0),
            foregroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
    );
  }
}
