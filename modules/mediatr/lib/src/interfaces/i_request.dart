/// Represents an interface for a request in the MediatR pattern.
/// The `IRequest` interface is used to define a request object that is sent to a mediator for processing.
/// It provides a method `hasValidate()` that can be implemented to perform validation on the request.
abstract class IRequest<T> {
  /// Checks if the request has validation logic.
  /// Returns a tuple with a boolean indicating if validation is required and an optional error message.
  (bool, String?) hasValidate() => (true, null);
}
