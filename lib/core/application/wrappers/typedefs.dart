import 'failure.dart';

typedef EitherFuture<T> = Future<(Failure?, T?)>;
