import 'i_request.dart';

abstract interface class IMediator {
  Future<T> send<R extends IRequest<T>, T>(R request);
}
