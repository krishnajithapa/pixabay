import 'package:dio/dio.dart';

String handleDioException(DioException error) {
  if (error.type == DioExceptionType.connectionTimeout ||
      error.type == DioExceptionType.sendTimeout ||
      error.type == DioExceptionType.receiveTimeout) {
    return "Request timed out. Please try again.";
  }

  if (error.type == DioExceptionType.cancel) {
    return "Request was cancelled.";
  }

  if (error.type == DioExceptionType.badResponse) {
    // Server responded with an error
    final statusCode = error.response?.statusCode ?? 0;
    switch (statusCode) {
      case 400:
        return "Bad request. Please check your input.";
      case 401:
        return "Unauthorized. Please login again.";
      case 403:
        return "Forbidden. You don't have permission.";
      case 404:
        return "Resource not found.";
      case 408:
        return "Request timeout.";
      case 500:
        return "Internal server error. Please try later.";
      case 502:
        return "Bad gateway.";
      case 503:
        return "Service unavailable. Please try later.";
      case 504:
        return "Gateway timeout.";
      default:
        // If your API provides error message in response body, try to extract it
        final errorMessage =
            error.response?.data?['message'] ??
            'Received invalid status code: $statusCode';
        return errorMessage;
    }
  }

  if (error.type == DioExceptionType.badCertificate) {
    return "Bad certificate.";
  }

  if (error.type == DioExceptionType.unknown) {
    if (error.error is FormatException) {
      return "Data format error. Unable to process response.";
    }
    return "Unexpected error occurred. Please try again.";
  }

  // Default fallback error message
  return "Something went wrong. Please try again.";
}
