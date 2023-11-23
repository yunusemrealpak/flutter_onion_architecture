import 'i_request.dart';

abstract interface class IRequestHandler<R extends IRequest<T>, T> {
  Future<T> handle(R request);
}
