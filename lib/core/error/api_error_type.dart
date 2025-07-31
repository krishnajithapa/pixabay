enum ApiErrorType {
  network, // Network/Dio related issues
  api, // API responded with error details
  unknown, // Unexpected issues (parsing, logic, etc.)
}
