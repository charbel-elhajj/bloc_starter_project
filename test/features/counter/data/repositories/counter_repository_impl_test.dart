import 'package:bloc_starter_project/core/error/exceptions.dart';
import 'package:bloc_starter_project/core/error/failures.dart';
import 'package:bloc_starter_project/features/counter/data/data_sources/counter_remote_data_source.dart';
import 'package:bloc_starter_project/features/counter/data/models/count_response_model.dart';
import 'package:bloc_starter_project/features/counter/data/repositories/counter_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'counter_repository_impl_test.mocks.dart';

@GenerateMocks([CounterRemoteDataSource])
void main() {
  group('CounterRepositoryImplTest -', () {
    late MockCounterRemoteDataSource remoteDataSource;
    late CounterRepositoryImpl repository;

    setUp(() {
      remoteDataSource = MockCounterRemoteDataSource();
      repository = CounterRepositoryImpl(remoteDataSource: remoteDataSource);
    });

    group('updateCount -', () {
      test('should return count on success', () async {
        // arrange
        const count = CountResponseModel(count: 0);
        when(remoteDataSource.updateCount()).thenAnswer((_) async => count);

        // act
        final response = await repository.updateCount();

        // assert
        expect(response.isRight(), isTrue);
      });

      test('should return ServerFailure on exception', () async {
        // arrange
        when(remoteDataSource.updateCount()).thenThrow(ServerException());

        // act
        final response = await repository.updateCount();

        // assert
        expect(response.isLeft(), isTrue);
        expect(response, Left(ServerFailure()));
      });
    });
  });
}
