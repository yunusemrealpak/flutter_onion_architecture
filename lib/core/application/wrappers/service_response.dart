import 'package:busenet/busenet.dart';

/// A wrapper class representing the response of a service operation.
///
/// The [ServiceResponse] class encapsulates the result of a service operation,
/// providing access to the returned data and any potential failure that occurred.
/// It is a generic class that takes a type parameter [T] to specify the type of the data.
///
/// Example usage:
/// ```dart
/// ServiceResponse<int> response = ServiceResponse.success(42);
/// if (response.hasData) {
///   print(response.data); // Output: 42
/// }
/// ```
class ServiceResponse<T> {
  final T? data;
  final Failure? failure;

  ServiceResponse({
    this.data,
    this.failure,
  });

  /// Creates a successful [ServiceResponse] with the given [data].
  ServiceResponse.success(this.data) : failure = null;

  /// Creates a failed [ServiceResponse] with the given [failure].
  ServiceResponse.failure(this.failure) : data = null;

  /// Returns `true` if the [ServiceResponse] contains data, `false` otherwise.
  bool get hasData => data != null;

  /// Returns `true` if the [ServiceResponse] contains a failure, `false` otherwise.
  bool get hasFailure => failure != null;
}
