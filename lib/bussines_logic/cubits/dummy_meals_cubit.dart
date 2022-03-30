import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funduk_app/DUMMY_MEALS.dart';
import 'package:funduk_app/bussines_logic/cubits/counter_dart_cubit.dart';

import '../../data/models/meal.dart';

part 'dummy_meals_state.dart';

class DummyMealsCubit extends Cubit<DummyMealsInitial> {
  DummyMealsCubit() : super(DummyMealsInitial(meal_uz: DUMMY_MEALS_UZ, id: 0));

  void changeLanguage(BuildContext context){
    var lang=BlocProvider.of<CounterDartCubit>(context);
    print(lang.getLang());
    print(lang.getNavRailIndex());
    if(lang.state.lang==1){

      switch(lang.getNavRailIndex()){
        case 0: state.meal_uz=DUMMY_MEALS_UZ;
         break;
        case 2: state.meal_uz=DUMMY_MEALS_UZ.where((element) => element.typeMeal=="Yevropacha").toList();
         break;
        case 3: state.meal_uz=DUMMY_MEALS_UZ.where((element) => element.typeMeal=="Yaponcha").toList();
         break;
        case 4: state.meal_uz=DUMMY_MEALS_UZ.where((element) => element.typeMeal=="Salat").toList();
        break;
        case 5: state.meal_uz=DUMMY_DRINK_UZ;

        break;
      }

    } else if(lang.state.lang==2) {
      switch(lang.getNavRailIndex()){
        case 0: state.meal_uz=DUMMY_MEALS;
        break;
        case 2: state.meal_uz=DUMMY_MEALS.where((element) => element.typeMeal=="Европейская").toList();
        break;
        case 3: state.meal_uz=DUMMY_MEALS.where((element) => element.typeMeal=="Японская").toList();
        break;
        case 4: state.meal_uz=DUMMY_MEALS.where((element) => element.typeMeal=="Салаты").toList();
        break;
        case 5: state.meal_uz=DUMMY_DRINK;
        break;

      }
    }
    emit(DummyMealsInitial(meal_uz: state.meal_uz,id: state.id));
  }

  Meal findById(int id){
    state.id=id;
    emit(DummyMealsInitial(meal_uz: state.meal_uz,id: state.id));
    return state.meal_uz[state.meal_uz.indexWhere((element) => element.id==id)];
  }
  Meal refreshItem(){
    return state.meal_uz[state.meal_uz.indexWhere((element) => element.id==state.id)];
  }



}
