import 'i_request.dart';

/// Represents the interface for a mediator.
/// A mediator is responsible for handling requests and returning responses.
abstract interface class IMediator {
  /// Sends a request to the mediator and returns a future that resolves to the response.
  /// The request must implement the [IRequest] interface.
  /// The response type is determined by the [T] parameter.
  Future<T> send<R extends IRequest<T>, T>(R request);
}
