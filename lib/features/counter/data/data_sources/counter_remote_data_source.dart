import 'package:bloc_starter_project/core/services/http_client_service.dart';
import 'package:bloc_starter_project/features/counter/data/models/count_response_model.dart';

abstract class CounterRemoteDataSource {
  Future<CountResponseModel> updateCount();
}

class CounterRemoteDataSourceImpl implements CounterRemoteDataSource {
  CounterRemoteDataSourceImpl({required this.client});

  final HttpClientService client;

  @override
  Future<CountResponseModel> updateCount() {
    return Future.delayed(
      const Duration(seconds: 2),
      () => const CountResponseModel(count: 0),
    );
  }
}
