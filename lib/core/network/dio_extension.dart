import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pixabay/core/error/api_error.dart';
import 'package:pixabay/core/error/api_error_type.dart';
import 'package:pixabay/core/error/failure.dart';
import 'package:pixabay/core/network/dio_client.dart';
import 'package:pixabay/core/network/dio_exception_handler.dart';
import 'package:pixabay/core/network/typedef.dart';

extension DioApiExtensions on DioClient {
  ResultFuture<T> safeGet<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    required T Function(Map<String, dynamic> json)? mapper,
    Map<String, dynamic>? mockJson,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      final statusCode = response.statusCode ?? 0;
      final data = response.data;

      if (statusCode < 200 || statusCode >= 300) {
        final errors =
            (data['errors'] as List<dynamic>?)
                ?.map((e) => ApiError.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [];

        return Left(
          Failure(
            errorType: ApiErrorType.api,
            errorMessage: getSingleMessage(errors),
          ),
        );
      }

      return Right(mapper!(data));
    } on DioException catch (e) {
      return Left(
        Failure(
          errorType: ApiErrorType.network,
          errorMessage: handleDioException(e),
        ),
      );
    } catch (e) {
      return Left(
        Failure(errorType: ApiErrorType.unknown, errorMessage: e.toString()),
      );
    }
  }
}

String getSingleMessage(List<ApiError> list) {
  if (list.isEmpty) return 'An unexpected error occurred.';
  return list.first.message;
}
