import 'package:bloc_starter_project/core/usecases/usecase.dart';
import 'package:bloc_starter_project/features/counter/domain/entities/count_response.dart';
import 'package:bloc_starter_project/features/counter/domain/repositories/counter_repository.dart';
import 'package:bloc_starter_project/features/counter/domain/usecases/update_count.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'update_count_test.mocks.dart';

@GenerateMocks([CounterRepository])
void main() {
  late MockCounterRepository repository;
  late UpdateCount useCase;

  group('UpdateCountTest -', () {
    setUp(() {
      repository = MockCounterRepository();
      useCase = UpdateCount(repository: repository);
    });

    test('should return count on success', () async {
      // arrange
      const count = CountResponse(count: 0);
      when(repository.updateCount()).thenAnswer((_) async => const Right(count));

      // act
      final result = await useCase(NoParams());

      // assert
      expect(result, const Right(count));
    });
  });
}
