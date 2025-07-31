import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;
  final CancelToken cancelToken = CancelToken();

  DioClient({required String baseUrl, List<Interceptor>? interceptors})
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 120),
          receiveTimeout: const Duration(seconds: 120),
        ),
      ) {
    // Add interceptors if provided
    if (interceptors != null) {
      _dio.interceptors.addAll(interceptors);
    }
  }

  Dio get dio => _dio;

  void cancelRequest([String reason = "Request canceled by user."]) {
    cancelToken.cancel(reason);
  }
}
