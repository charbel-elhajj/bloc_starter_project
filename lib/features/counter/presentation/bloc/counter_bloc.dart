import 'dart:async';

import 'package:bloc_starter_project/core/usecases/usecase.dart';
import 'package:bloc_starter_project/features/counter/domain/usecases/update_count.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc({
    required this.updateCount,
  }) : super(const ShowingCount(0)) {
    on<CounterIncrement>(_onCounterIncrement);
    on<CounterUpdate>(_onCounterUpdate);
  }

  final UpdateCount updateCount;

  FutureOr<void> _onCounterIncrement(CounterIncrement event, Emitter<CounterState> emit) {
    if (state is ShowingCount) {
      final inc = event.incrementBy;
      final updatedCount = (state as ShowingCount).count + inc;

      emit(ShowingCount(updatedCount));
    }
  }

  FutureOr<void> _onCounterUpdate(CounterUpdate event, Emitter<CounterState> emit) async {
    if (state is ShowingCount) {
      final currentCount = (state as ShowingCount).count;
      emit(const Loading());
      final response = await updateCount(NoParams());
      response.fold(
        (l) => emit(ShowingCount(currentCount)),
        (r) => emit(ShowingCount(r.count)),
      );
    }
  }
}
