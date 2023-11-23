import 'failure.dart';

final class ServiceResponse<T> {
  final T? data;
  final Failure? failure;

  ServiceResponse({
    this.data,
    this.failure,
  });

  ServiceResponse.success(this.data) : failure = null;
  ServiceResponse.failure(this.failure) : data = null;

  bool get hasData => data != null;
  bool get hasFailure => failure != null;
}
