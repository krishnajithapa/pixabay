import 'package:flutter_test/flutter_test.dart';
import 'package:pixabay/core/network/dio_client.dart';

void main() {
  group('DioClient', () {
    test('dio instance is created with correct baseUrl', () {
      final client = DioClient(baseUrl: 'https://example.com');
      expect(client.dio.options.baseUrl, 'https://example.com');
    });

    test('cancelRequest cancels the token', () {
      final client = DioClient(baseUrl: 'https://example.com');
      expect(client.cancelToken.isCancelled, isFalse);
      client.cancelRequest('test');
      expect(client.cancelToken.isCancelled, isTrue);
    });
  });
}
