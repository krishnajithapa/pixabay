import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.g.dart';

@JsonSerializable()
class ApiError with _$ApiError {
  const factory ApiError({required String error, required String message}) =
      _ApiError;

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);
}
