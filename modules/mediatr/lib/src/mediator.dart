import 'package:mediatr/src/injector.dart';

import 'interfaces/i_mediator.dart';
import 'interfaces/i_request.dart';
import 'interfaces/i_request_handler.dart';

/// Mediator class that implements the IMediator interface.
/// It provides a method to send a request and get a response.
class Mediator implements IMediator {
  @override
  Future<T> send<R extends IRequest<T>, T>(R request) async {
    final handler = MediatorInjector().instance<IRequestHandler<R, T>>();
    return await handler.handle(request);
  }
}
