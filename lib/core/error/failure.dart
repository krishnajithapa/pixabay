import 'package:pixabay/core/error/api_error_type.dart';

class Failure {
  String? errorMessage;
  ApiErrorType? errorType;
  Failure({this.errorMessage, this.errorType});
}
