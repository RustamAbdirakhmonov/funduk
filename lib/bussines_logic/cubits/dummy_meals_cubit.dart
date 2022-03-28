import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funduk_app/DUMMY_MEALS.dart';
import 'package:funduk_app/bussines_logic/cubits/counter_dart_cubit.dart';
import 'package:meta/meta.dart';

import '../../data/models/meal.dart';

part 'dummy_meals_state.dart';

class DummyMealsCubit extends Cubit<DummyMealsInitial> {
  DummyMealsCubit() : super(DummyMealsInitial(meal_uz: DUMMY_MEALS_UZ));

  void changeLanguage(BuildContext context){
    var lang=BlocProvider.of<CounterDartCubit>(context);
    print(lang.getLang());
    print(lang.getNavRailIndex());
    if(lang.getLang()==1){

      switch(lang.getNavRailIndex()){
        case 0: state.meal_uz=DUMMY_MEALS_UZ;
         break;
        case 5: state.meal_uz=DUMMY_DRINK_UZ;
      }

    } else if(lang.getLang()==2) {
      switch(lang.getNavRailIndex()){
        case 0: state.meal_uz=DUMMY_MEALS;
        break;
        case 5: state.meal_uz=DUMMY_DRINK;
      }
    }
    emit(DummyMealsInitial(meal_uz: state.meal_uz));
  }

}
