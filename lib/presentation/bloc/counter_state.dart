

abstract class CounterState {
  final int value;
  CounterState({required this.value});
}

class CounterInitial extends CounterState {
  CounterInitial(): super(value: 0);
}

class CounterValue extends CounterState {
  CounterValue(int value): super(value: value);
}