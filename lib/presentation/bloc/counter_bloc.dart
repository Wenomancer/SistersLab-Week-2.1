
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super (CounterInitial()) {
    on<Increment>((event, emit) {
      emit(CounterValue(state.value + 1));
    });
    on<Decrement>((event, emit) {
      emit(CounterValue(state.value - 1));
    });
  }
}