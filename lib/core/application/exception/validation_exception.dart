import 'package:busenet/busenet.dart';

/// Exception thrown when a validation error occurs.
class ValidationException extends Failure {
  /// Creates a new instance of [ValidationException].
  ///
  /// The [message] parameter is optional and defaults to "Validation Error".
  ValidationException({super.message = "Validation Error"});
}
