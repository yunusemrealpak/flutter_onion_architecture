final class ValidationException implements Exception {
  final String message;

  ValidationException([this.message = "Validation Error"]);
}
