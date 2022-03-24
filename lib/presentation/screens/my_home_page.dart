import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:funduk_app/DUMMY_MEALS.dart';
import 'package:funduk_app/data/models/meal.dart';
import 'package:funduk_app/presentation/widgets/main_drawer.dart';
import 'package:funduk_app/presentation/widgets/meal_item.dart';
class MyHomePage extends StatefulWidget {
  static const routeArgs='/';
  const MyHomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  void initalization() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }
  Color color = Colors.white;
  @override
  void initState() {
    initalization();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    MealItem meal;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: color,
      body: Row(
        children: <Widget>[
          MainDrawer(color: Colors.indigo),
          Container(
            width: width * .82,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Мы очень рады что ',
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                      TextSpan(
                          text: 'вы выбрали Наше \n ресторан, спасибо за визит!',
                          style: TextStyle(color: Colors.blue, fontSize: 16)),
                    ])),
                Container(
                  height: height * 0.91,
                  width: width * 1,
                  child: GridView.builder(
                    padding: EdgeInsets.all(5),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent:height*.35,
                      childAspectRatio: 0.52,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return MealItem(color: (COLORS..shuffle()).last,
                          imageUrl: DUMMY_MEALS[index].imageUrl,
                          countIng: DUMMY_MEALS[index].ingriedent.length,
                          price: DUMMY_MEALS[index].cost,
                          typeMeal: DUMMY_MEALS[index].typeMeal,
                          title: DUMMY_MEALS[index].title,
                          ingriedents: DUMMY_MEALS[index].ingriedent,
                          subType: DUMMY_MEALS[index].subType,
                          description: DUMMY_MEALS[index].description,

                      );
                    },
                    itemCount: DUMMY_MEALS.length,
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
