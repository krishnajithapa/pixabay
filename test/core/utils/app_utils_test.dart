import 'package:flutter_test/flutter_test.dart';
import 'package:pixabay/core/utils/app_utils.dart';

void main() {
  group('AppUtils.formatFileSize', () {
    test('formats bytes less than 1000', () {
      expect(AppUtils.formatFileSize(999), '999');
      expect(AppUtils.formatFileSize(0), '0');
    });

    test('formats kilobytes', () {
      expect(AppUtils.formatFileSize(1000), '1K');
      expect(AppUtils.formatFileSize(1500), '1.5K');
    });

    test('formats megabytes', () {
      expect(AppUtils.formatFileSize(1000000), '1M');
      expect(AppUtils.formatFileSize(1500000), '1.5M');
    });

    test('formats gigabytes', () {
      expect(AppUtils.formatFileSize(1000000000), '1GB');
      expect(AppUtils.formatFileSize(1500000000), '1.5GB');
    });
  });
}
