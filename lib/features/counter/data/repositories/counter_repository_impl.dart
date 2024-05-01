import 'package:bloc_starter_project/core/error/failures.dart';
import 'package:bloc_starter_project/features/counter/data/data_sources/counter_remote_data_source.dart';
import 'package:bloc_starter_project/features/counter/domain/entities/count_response.dart';
import 'package:bloc_starter_project/features/counter/domain/repositories/counter_repository.dart';
import 'package:dartz/dartz.dart';

class CounterRepositoryImpl extends CounterRepository {
  final CounterRemoteDataSource remoteDataSource;

  CounterRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, CountResponse>> updateCount() async {
    try {
      final response = await remoteDataSource.updateCount();
      return Right(response);
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}
