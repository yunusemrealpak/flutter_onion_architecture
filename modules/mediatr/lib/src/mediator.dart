import 'package:mediatr/src/injector.dart';

import 'interfaces/i_mediator.dart';
import 'interfaces/i_request.dart';
import 'interfaces/i_request_handler.dart';

class Mediator implements IMediator {
  @override
  Future<T> send<R extends IRequest<T>, T>(R request) async {
    final handler = MediatorInjector().instance<IRequestHandler<R, T>>();
    return await handler.handle(request);
  }
}
