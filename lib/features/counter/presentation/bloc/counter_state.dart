part of 'counter_bloc.dart';

class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

class ShowingCount extends CounterState {
  const ShowingCount(this.count);

  final int count;

  @override
  List<Object> get props => [count];
}

class Loading extends CounterState {
  const Loading();
}
