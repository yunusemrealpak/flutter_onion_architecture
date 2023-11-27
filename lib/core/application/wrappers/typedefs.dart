import 'package:busenet/busenet.dart';

/// A typedef representing a future that returns an [Either] object.
///
/// The [EitherFuture] typedef is used to define a future that can return either a [Failure] or a value of type [T].
/// It is commonly used in asynchronous operations where the result can have two possible outcomes.
typedef EitherFuture<T> = Future<(Failure?, T?)>;
