import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pixabay/core/constants/app_constants.dart';
import 'package:pixabay/core/network/alice_interceptor.dart';
import 'package:pixabay/core/network/dio_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @Named('BaseUrl')
  String get baseUrl => AppConstants.baseUrl;

  @lazySingleton
  PrettyDioLogger get logger => PrettyDioLogger();

  @lazySingleton
  AliceInterceptor get aliceInterceptor => AliceInterceptor();

  @lazySingleton
  List<Interceptor> interceptors(
    PrettyDioLogger logger,
    AliceInterceptor alice,
  ) {
    return [logger, alice.alice.getDioInterceptor()];
  }

  @lazySingleton
  DioClient dioClient(
    @Named('BaseUrl') String baseUrl,
    List<Interceptor> interceptors,
  ) {
    return DioClient(baseUrl: baseUrl, interceptors: interceptors);
  }
}
