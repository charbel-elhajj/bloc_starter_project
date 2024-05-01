import 'package:bloc_starter_project/core/error/failures.dart';
import 'package:bloc_starter_project/core/usecases/usecase.dart';
import 'package:bloc_starter_project/features/counter/domain/entities/count_response.dart';
import 'package:bloc_starter_project/features/counter/domain/repositories/counter_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateCount extends UseCase<CountResponse, NoParams> {
  UpdateCount({required this.repository});

  final CounterRepository repository;

  @override
  Future<Either<Failure, CountResponse>> call(NoParams params) {
    return repository.updateCount();
  }
}
