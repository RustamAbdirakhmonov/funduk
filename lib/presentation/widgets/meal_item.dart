import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funduk_app/bussines_logic/cubits/counter_dart_cubit.dart';

class MealItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${price.toStringAsFixed(0)} сум',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                    Container(
                      width: 200,
                      height: 100,
                      child: Image.asset(
                        imageUrl,
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
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 16,
                              )),
                          BlocBuilder<CounterDartCubit, CounterState>(
                            builder: (context, state) {
                              return Text(
                                state.counter.toString(),
                                style: TextStyle(
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
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 16,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.indigo,borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Icon(Icons.shopping_cart,color: Colors.white,size:16,),
                         TextButton(
                           onPressed: () {},
                           child: Text(
                             'Добавит в меню',
                             style: TextStyle(
                                 color: Colors.white, fontWeight: FontWeight.w700),
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
                    height:50 ,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child:SvgPicture.asset('assets/images/cancel.svg',height: 16,color: Colors.indigo,),
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
          decoration: BoxDecoration(boxShadow: [
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
            margin: EdgeInsets.all(5),
            width: width * .45,
            height: height * .3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: color,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.grey.withOpacity(.25),
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                  )
                ]),
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Text(
                  '| ${typeMeal}',
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                SizedBox(
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
                      price.toStringAsFixed(0),
                      style: TextStyle(
                          color: Colors.black.withOpacity(.8), fontSize: 12),
                    )
                  ],
                ),
                SizedBox(
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
                      '${countIng.toString()} инг',
                      style: TextStyle(
                          color: Colors.black.withOpacity(.8), fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Icon(
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
                      padding: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(
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
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
}
