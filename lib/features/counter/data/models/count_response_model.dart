import 'package:bloc_starter_project/features/counter/domain/entities/count_response.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'count_response_model.g.dart';

@JsonSerializable()
class CountResponseModel extends CountResponse {
  factory CountResponseModel.fromJson(Map<String, dynamic> json) {
    return _$CountResponseModelFromJson(json);
  }

  const CountResponseModel({required super.count});

  Map<String, dynamic> toJson() => _$CountResponseModelToJson(this);
}
