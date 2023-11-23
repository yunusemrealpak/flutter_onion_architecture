class MediatorInjector {
  static final _instance = MediatorInjector._internal();
  factory MediatorInjector() => _instance;
  MediatorInjector._internal();

  T Function<T extends Object>()? getter;

  void register(T Function<T extends Object>() func) {
    getter = func;
  }

  T instance<T extends Object>() {
    if (getter == null) {
      throw Exception('MediatorInjectionProvider is not registered');
    }
    return getter!<T>();
  }
}
