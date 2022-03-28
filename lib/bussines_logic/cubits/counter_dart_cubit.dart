import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_dart_state.dart';

class CounterDartCubit extends Cubit<CounterState> {
  CounterDartCubit() : super(CounterState(counter: 0,navIndex: 0,lang: 1));
  void increment() => emit(CounterState(counter: state.counter+1,navIndex: state.navIndex,lang: state.lang));

  void decrement() => emit(CounterState(counter: state.counter>0?state.counter-1:0,navIndex: state.navIndex,lang: state.lang));
  void get counter=>state.counter;
  void doNull()=>emit(CounterState(counter: 0,navIndex: state.navIndex,lang: state.lang));
  void installCounter(int count)=>emit(CounterState(counter: count,navIndex: state.navIndex,lang: state.lang));
  void setNavRailIndex(int index){
    state.navIndex=index;
    emit(CounterState(counter: state.counter, navIndex: state.navIndex,lang: state.lang));
  }
  int getNavRailIndex(){
    return state.navIndex;
  }
  void setLang(int lang){
    state.lang=lang;
    emit(CounterState(counter: state.counter, navIndex: state.navIndex,lang: state.lang));
  }
  int getLang(){
    return state.lang;
  }

}
