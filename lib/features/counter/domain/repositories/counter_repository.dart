import 'package:bloc_starter_project/core/error/failures.dart';
import 'package:bloc_starter_project/features/counter/domain/entities/count_response.dart';
import 'package:dartz/dartz.dart';

abstract class CounterRepository {
  Future<Either<Failure, CountResponse>> updateCount();
}
