import 'dart:convert';

import 'package:bloc_starter_project/features/counter/data/models/count_response_model.dart';
import 'package:bloc_starter_project/features/counter/domain/entities/count_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const model = CountResponseModel(count: 0);

  group('CountResponseModelTest -', () {
    test('is a CountResponse', () {
      expect(model, isA<CountResponse>());
    });

    group('fromJson -', () {
      test('should return valid model', () async {
        // arrange
        final jsonMap = json.decode(fixture('counter_response_model.json'));

        // act
        final result = CountResponseModel.fromJson(jsonMap);

        // assert
        expect(result.count, model.count);
      });
    });

    group('toJson', () {
      test('should return a JSON map containing the proper data', () async {
        // arrange
        final expected = {
          'count': 0,
        };
        // act
        final actual = model.toJson();

        // assert
        expect(actual, expected);
      });
    });
  });
}
