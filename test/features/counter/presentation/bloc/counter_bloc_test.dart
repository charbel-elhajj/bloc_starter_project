import 'package:bloc_starter_project/core/error/failures.dart';
import 'package:bloc_starter_project/features/counter/domain/entities/count_response.dart';
import 'package:bloc_starter_project/features/counter/domain/usecases/update_count.dart';
import 'package:bloc_starter_project/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'counter_bloc_test.mocks.dart';

@GenerateMocks([UpdateCount])
void main() {
  late MockUpdateCount updateCount;
  late CounterBloc bloc;

  group('CounterBlocTest -', () {
    setUp(() {
      updateCount = MockUpdateCount();
      bloc = CounterBloc(updateCount: updateCount);
    });

    tearDown(() => bloc.close());

    test('should initially display 0', () async {
      expect(bloc.state, const ShowingCount(0));
    });

    group('CounterIncrement -', () {
      group('when state is not ShowingCount', () {
        blocTest(
          'emits []',
          build: () => bloc..emit(const Loading()),
          act: (bloc) => bloc.add(const CounterIncrement()),
          expect: () => [],
        );
      });

      group('when state ShowingCount', () {
        blocTest(
          'emits [ShowingCount]',
          build: () => bloc..emit(const ShowingCount(0)),
          act: (bloc) => bloc.add(const CounterIncrement(incrementBy: 2)),
          expect: () => [const ShowingCount(2)],
        );
      });
    });

    group('CounterUpdate -', () {
      group('when state is not ShowingCount', () {
        blocTest(
          'emits []',
          build: () => bloc..emit(const Loading()),
          act: (bloc) => bloc.add(const CounterUpdate()),
          expect: () => [],
        );
      });

      group('when state ShowingCount and call succeeds', () {
        setUp(() {
          when(updateCount(any)).thenAnswer((_) async => const Right(CountResponse(count: 0)));
        });
        blocTest(
          'emits [Loading, ShowingCount]',
          build: () => bloc..emit(const ShowingCount(1)),
          act: (bloc) => bloc.add(const CounterUpdate()),
          expect: () => const [Loading(), ShowingCount(0)],
        );
      });

      group('when state ShowingCount and call fails', () {
        setUp(() {
          when(updateCount(any)).thenAnswer((_) async => Left(ServerFailure()));
        });
        blocTest(
          'emits [Loading, ShowingCount]',
          build: () => bloc..emit(const ShowingCount(1)),
          act: (bloc) => bloc.add(const CounterUpdate()),
          expect: () => const [Loading(), ShowingCount(1)],
        );
      });
    });
  });
}
