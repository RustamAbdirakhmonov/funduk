
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funduk_app/bussines_logic/cubits/dummy_meals_cubit.dart';
import 'package:funduk_app/data/models/cart.dart';
import 'package:funduk_app/data/models/meal.dart';

part 'cart_dart_state.dart';

class CartDartCubit extends Cubit<CartDartInitial> {
  CartDartCubit() : super(CartDartInitial(list: [],sum:0,countMeals: 0,meal: Meal(id:0,title:'',typeMeal: '',subType: '',ingriedent: [],description: '',cost: 0,imageUrl: '',videoId: '')));

  void addList(Cart cart) {
    // state.list.where((element) => element.title!=cart.title)!=null?{}:  // Barcha element qo'shilgandan kiyn  yoqamiz
    state.list.add(cart);
    emit(CartDartInitial(list: state.list,sum: state.sum,countMeals: state.countMeals,meal: state.meal));
  }

  void incrementCart(int count, String id) {
    state.list[state.list.indexWhere((element) => element.id == id)].count = count + 1;
    emit(CartDartInitial(list: state.list,sum: state.sum,countMeals: state.countMeals,meal: state.meal));
  }
  void decrementCart(int count, String id) {
    count >1
        ? state.list.where((element) => element.id == id).first.count =
            (count - 1)
        : state.list.removeWhere((element) => element.id == id);
    emit(CartDartInitial(list: state.list,sum: state.sum,countMeals: state.countMeals,meal: state.meal));
  }

  void removeList(){
    state.list.clear();
    emit(CartDartInitial(list: state.list,sum: state.sum,countMeals: state.countMeals,meal: state.meal));
  }
  void removieItem(String id){
    state.list.removeWhere((element) => element.id==id);
    emit(CartDartInitial(list: state.list,sum: state.sum,countMeals: state.countMeals,meal: state.meal));
  }

  void sumOfPrices(){
     state.sum=0;
    for(int i=0;i<state.list.length;i++){
      state.sum+=state.list[i].count*state.list[i].price;
    }
    emit(CartDartInitial(list: state.list, sum: state.sum,countMeals: state.countMeals,meal: state.meal));
  }

  void countItems(){
    state.countMeals=0;
    for(int i=0;i<state.list.length;i++){
      state.countMeals+=state.list[i].count;
    }
    emit(CartDartInitial(list: state.list, sum: state.sum,countMeals: state.countMeals,meal: state.meal));
  }
  void setMeal(Meal meal,BuildContext context){
    state.meal=meal;
    emit(CartDartInitial(list: state.list, sum: state.sum,countMeals: state.countMeals,meal: state.meal));
  }
   Meal getMeal()=> state.meal;

  Cart findByVideoId(String videoId){
    return state.list[state.list.indexWhere((element) => element.videoId==videoId)];
  }

}
