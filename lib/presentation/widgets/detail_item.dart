import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  String title;
  String typeMeal;
  String subType;
  List<String> ingriedent;
  String description;
  double cost;
  String imageUrl;

  DetailItem({
    required this.title,
    required this.typeMeal,
    required this.subType,
    required this.ingriedent,
    required this.description,
    required this.cost,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
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
                              onPressed: () {},
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
                          '| ${typeMeal}',
                          style: TextStyle(color: Colors.blue),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          title,
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
                                  '${ingriedent.length} инг',
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
                                  '485 кал',
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
                              '${description}',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(.6)),
                              textAlign: TextAlign.justify,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Ингридиенты (${ingriedent.length})',
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
                          height: MediaQuery.of(context).size.height * .28,
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
                                      color: Color(Random().nextInt(0xffffffff))
                                          .withAlpha(0xff),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    width: 60,
                                    height: 60,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      ingriedent[index],
                                      textAlign: TextAlign.center,
                                    ),
                                    width: 60,
                                  )
                                ],
                              );
                            },
                            itemCount: ingriedent.length,
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
                      imageUrl,
                      fit: BoxFit.contain,
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
