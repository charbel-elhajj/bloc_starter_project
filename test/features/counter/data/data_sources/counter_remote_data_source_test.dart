import 'package:bloc_starter_project/core/services/http_client_service.dart';
import 'package:bloc_starter_project/features/counter/data/data_sources/counter_remote_data_source.dart';
import 'package:bloc_starter_project/features/counter/data/models/count_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'counter_remote_data_source_test.mocks.dart';

@GenerateMocks([HttpClientService])
void main() {
  late MockHttpClientService client;
  late CounterRemoteDataSourceImpl dataSource;

  group('CounterRemoteCountDataSourceTest -', () {
    setUp(() {
      client = MockHttpClientService();
      dataSource = CounterRemoteDataSourceImpl(client: client);
    });

    group('updateCount -', () {
      test('should return count', () async {
        // arrange

        // act
        final response = await dataSource.updateCount();

        // assert
        expect(response, isA<CountResponseModel>());
      });
    });
  });
}
