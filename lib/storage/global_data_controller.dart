part of '../com_client.dart';

/// [GlobalDataController] holds all global data and notifies listeners
/// when the data changes.
class GlobalDataController {
  static final Map<Type, Map<String, dynamic>> _globalData = {};

  static final Map<Type, List<GlobalListener<dynamic>>> _globalListeners = {};

  /// Registers a [GlobalListener] to listen to changes in [GlobalData].
  static void registerGlobalListener<T>(GlobalListener<T> listener) {
    _globalListeners[T] ??= [];
    _globalListeners[T]!.add(listener);
  }

  /// Unregisters a [GlobalListener] from listening to changes in [GlobalData].
  static void unregisterGlobalListener<T>(GlobalListener<T> listener) {
    _globalListeners[T] ??= [];
    _globalListeners[T]!.remove(listener);
  }

  /// Sets the global [data] for the given [key] and [T].
  ///
  /// To hide the update from listeners, set [notify] to false.
  static void setGlobalData<T>(String key, T data, {bool notify = true}) {
    _globalData[T] ??= {};
    _globalData[T]![key] = data;

    if (!notify) return;
    _globalListeners[T]?.forEach((listener) {
      if (listener.key == key) (listener as GlobalListener<T>).listener(data);
    });
  }

  /// Gets the global data for the given [key] and [T].
  static T getGlobalData<T>(String key) {
    _globalData[T] ??= {};
    return _globalData[T]![key] as T;
  }
}
