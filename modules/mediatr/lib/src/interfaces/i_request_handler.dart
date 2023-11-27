import 'i_request.dart';

/// Represents an interface for handling requests.
/// Implementations of this interface should provide a way to handle a specific type of request
/// and return a result of type [T].
/// The request type [R] should implement the [IRequest] interface.
abstract interface class IRequestHandler<R extends IRequest<T>, T> {
  /// Handles the given [request] and returns a future that completes with the result of type [T].
  Future<T> handle(R request);
}
