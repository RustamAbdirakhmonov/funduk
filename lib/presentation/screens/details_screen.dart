import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funduk_app/bussines_logic/cubits/cart_dart_cubit.dart';
import 'package:funduk_app/bussines_logic/cubits/dummy_meals_cubit.dart';
import 'package:funduk_app/presentation/widgets/detail_item.dart';
import 'package:funduk_app/presentation/widgets/main_drawer.dart';

class DetailsScreen extends StatelessWidget {

  const DetailsScreen({Key? key}) : super(key: key);
  static const routeArgs = 'details_screen';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover)),
      child: Row(children: [
        MainDrawer(color: Colors.indigo),
        BlocBuilder<DummyMealsCubit,DummyMealsInitial>(
          builder: (context, state) {
            return DetailItem();
          },
        ),
      ]),
    ));
  }
}
