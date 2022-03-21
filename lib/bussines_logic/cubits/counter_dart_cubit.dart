import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_dart_state.dart';

class CounterDartCubit extends Cubit<CounterState> {
  CounterDartCubit() : super(CounterState(counter: 0));
  void increment() => emit(CounterState(counter: state.counter+1));

  void decrement() => emit(CounterState(counter: state.counter>0?state.counter-1:0));
}
