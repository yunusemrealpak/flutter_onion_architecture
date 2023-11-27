/// A class that provides dependency injection for the Mediator pattern.
/// It allows subscribing to and retrieving instances of objects.
class MediatorInjector {
  static final _instance = MediatorInjector._internal();
  factory MediatorInjector() => _instance;
  MediatorInjector._internal();

  T Function<T extends Object>()? getter;

  /// Subscribes a function that provides an instance of type `T`.
  /// The subscribed function will be used to retrieve instances of type `T`.
  void subscribe<T extends Object>(T Function<T extends Object>() func) {
    getter = func;
  }

  /// Retrieves an instance of type `T` using the subscribed function.
  /// Throws an exception if no function is subscribed.
  T instance<T extends Object>() {
    if (getter == null) {
      throw Exception('MediatorInjectionProvider is not registered');
    }
    return getter!<T>();
  }
}
