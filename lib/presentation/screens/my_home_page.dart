import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funduk_app/DUMMY_MEALS.dart';
import 'package:funduk_app/bussines_logic/cubits/counter_dart_cubit.dart';
import 'package:funduk_app/bussines_logic/cubits/dummy_meals_cubit.dart';
import 'package:funduk_app/presentation/widgets/main_drawer.dart';
import 'package:funduk_app/presentation/widgets/meal_item.dart';

class MyHomePage extends StatefulWidget {
  static const routeArgs = '/';

  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CounterDartCubit>(context);

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
      body: SizedBox(
        width:width ,
        child: Row(
          children: <Widget>[
            MainDrawer(color: Colors.indigo),
            BlocBuilder<CounterDartCubit, CounterState>(
              builder: (context, state) {
                return Container(
                  width: width * .82,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: height * .03,),
                      Container(
                        height: height * .06,
                        child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: (state.lang == 1 || state.lang == 2)
                                          ? "title".tr()
                                          : "title".tr(),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16)),
                                  TextSpan(
                                      text: (state.lang == 1 || state.lang == 2)
                                          ? "title1".tr()
                                          : "title1".tr(),
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 16)),
                                ])),
                      ),
                      BlocBuilder<DummyMealsCubit,
                          DummyMealsInitial>(
                        builder: (context, state) {
                          return Container(
                            height: height * 0.91,
                            width: width * 1,
                            child: GridView.builder(
                              scrollDirection:Axis.vertical,
                        padding: EdgeInsets.all(5),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: height * .35,
                            childAspectRatio: 0.52,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                            return  MealItem(
                                  color: (COLORS..shuffle()).last,
                                  imageUrl: state.meal_uz[index].imageUrl,
                                  countIng: state.meal_uz[index].ingriedent.length,
                                  price: state.meal_uz[index].cost,
                                  typeMeal: state.meal_uz[index].typeMeal,
                                  title: state.meal_uz[index].title,
                                  ingriedents: state.meal_uz[index].ingriedent,
                                  subType: state.meal_uz[index].subType,
                                  description: state.meal_uz[index].description,
                                  videoId: state.meal_uz[index].videoId,
                                );
                              },
                              itemCount:state.meal_uz.length,
                            ),
                          );

                         },
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
