import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funduk_app/bussines_logic/cubits/dummy_meals_cubit.dart';
import 'package:funduk_app/presentation/screens/youtube_screen.dart';

class DetailItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var meal = BlocProvider.of<DummyMealsCubit>(context).refreshItem();
    return BlocBuilder<DummyMealsCubit, DummyMealsInitial>(
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width * .82,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        height: MediaQuery.of(context).size.height * .2,
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(
                                    Icons.navigate_before,
                                    color: Colors.indigo,
                                  ),
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(YouTubeIframeItem.routeArgs);
                                  },
                                  icon: Icon(
                                    Icons.play_arrow,
                                    color: Colors.indigo,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .8,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .2,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width * .7,
                        height: MediaQuery.of(context).size.height * .8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              '| ${meal.typeMeal}',
                              style: TextStyle(color: Colors.blue),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              meal.title,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 40),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/img.png',
                                      width: 25,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${meal.ingriedent.length} ${"ing".tr()}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/img2.png',
                                      width: 12,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '485 ${"kal".tr()}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * .7,
                                child: Text(
                                  '${meal.description}',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(.6)),
                                  textAlign: TextAlign.left,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${"ingriedent".tr()} (${meal.ingriedent.length})',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .7,
                              height: MediaQuery.of(context).size.height * .26,
                              child: GridView.builder(
                                scrollDirection: Axis.vertical,
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 100,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 2 / 2,
                                  mainAxisExtent: 120,
                                ),
                                itemBuilder: (BuildContext context, index) {
                                  return Column(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(
                                                  Random().nextInt(0xffffffff))
                                              .withAlpha(0xff),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        width: 60,
                                        height: 60,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        child: Text(
                                          meal.ingriedent[index],
                                          textAlign: TextAlign.center,
                                        ),
                                        width: 60,
                                      )
                                    ],
                                  );
                                },
                                itemCount: meal.ingriedent.length,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    top: 20,
                    right: 0,
                    child: Container(
                        width: MediaQuery.of(context).size.width * .6,
                        height: MediaQuery.of(context).size.width * .6,
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          meal.imageUrl,
                          fit: BoxFit.contain,
                        )),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
