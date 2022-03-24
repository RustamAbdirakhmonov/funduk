import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_dart_state.dart';

class CounterDartCubit extends Cubit<CounterState> {
  CounterDartCubit() : super(CounterState(counter: 0,navIndex: 0));
  void increment() => emit(CounterState(counter: state.counter+1,navIndex: state.navIndex));

  void decrement() => emit(CounterState(counter: state.counter>0?state.counter-1:0,navIndex: state.navIndex));
  void get counter=>state.counter;
  void doNull()=>emit(CounterState(counter: 0,navIndex: state.navIndex));
  void installCounter(int count)=>emit(CounterState(counter: count,navIndex: state.navIndex));
  void setNavRailIndex(int index){
    state.navIndex=index;
    print(state.navIndex);
    emit(CounterState(counter: state.counter, navIndex: state.navIndex));
  }

}
