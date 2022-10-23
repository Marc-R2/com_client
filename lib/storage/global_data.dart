part of '../com_client.dart';

/// [GlobalData] provides a way to store global data that can be accessed from
/// anywhere in the application.
///
/// [GlobalData] is a interface for [GlobalDataController].
///
/// Listen to changes in [GlobalData] with [listen].
class GlobalData<T> {
  /// Creates a [GlobalData] instance with the given [key] and initial [value].
  GlobalData({required this.key, required T value}) {
    this.value = value;
  }

  /// Creates a [GlobalData] instance with the given [key] and without a value.
  ///
  /// Can be used to create a listener that listens to changes in the given
  /// [key] when the original Object is not accessible.
  ///
  /// Be careful when using this constructor and make sure the [value] is set
  /// before this [GlobalData] is used at another point.
  GlobalData.withoutValue({required this.key});

  /// Creates a [GlobalData] instance without a explicit [key].
  ///
  /// The [key] will be set to the current Timestamp as String at the time of
  /// creation.
  ///
  /// This is useful when you want to create a [GlobalData] instance that is
  /// unique, can be accessed from anywhere in the application and you don't
  /// want to worry about setting a [key] which might be used somewhere else.
  ///
  /// You can use [GlobalData.key] to get the [key]
  /// of this [GlobalData] instance.
  GlobalData.withoutKey({required T value}) : key = _genKey() {
    this.value = value;
  }

  /// Creates a [GlobalData] instance with a initial null value.
  static GlobalData<T?> nullable<T>({String? key}) =>
      GlobalData<T?>(key: key ?? _genKey(), value: null);

  static String _genKey() => DateTime.now().toString();

  /// The key of this [GlobalData] instance that this value is registered
  /// within [GlobalDataController].
  final String key;

  /// Set the current value of this [GlobalData] instance.
  ///
  /// This value is stored globally within [GlobalDataController] under the
  /// [key] and all [GlobalListener] that listen to this [key] will be notified.
  set value(T value) => GlobalDataController.setGlobalData<T>(key, value);

  /// Get the current value of this [GlobalData] instance.
  T get value => GlobalDataController.getGlobalData<T>(key);

  /// Listener that listens to changes in this [GlobalData] instance.
  final List<GlobalListener<T>> _listeners = [];

  /// Create a [GlobalListener] that listens to changes in this [GlobalData].
  GlobalListener<T> listen(void Function(T) listen) {
    final listener = GlobalListener<T>(listen, this);
    _listeners.add(listener);
    return listener;
  }

  /// Remove a [GlobalListener] from this [GlobalData].
  ///
  /// This is automatically called when a [GlobalListener] is disposed.
  ///
  /// Prefer to use [GlobalListener.dispose] instead of this method.
  void removeListener(GlobalListener<T> listener) {
    _listeners.remove(listener);
  }

  /// Disposes this [GlobalData].
  ///
  /// This will dispose all [GlobalListener]s that listen to this [GlobalData].
  ///
  /// Other [GlobalData]s might still listen to the same [key] and will not be
  /// disposed.
  void dispose() {
    for (final listener in _listeners) {
      listener.dispose();
    }
  }
}
