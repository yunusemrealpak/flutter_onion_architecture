import 'package:busenet/busenet.dart';

/// Represents a failure specific to the application.
/// Inherits from the [Failure] class.
class AppFailure extends Failure {
  /// Constructs an instance of [AppFailure] with an optional [message].
  AppFailure({super.message});
}
