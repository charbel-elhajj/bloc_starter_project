part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class CounterIncrement extends CounterEvent {
  const CounterIncrement({this.incrementBy = 1});

  final int incrementBy;
}

class CounterUpdate extends CounterEvent {
  const CounterUpdate();
}
