part of '../com_client.dart';

/// [JoinedGlobalListener] joins multiple [GlobalData]s and listens to changes
/// in them.
class JoinedGlobalListener<T> {
  JoinedGlobalListener.fromList(
    this.listener, [
    List<GlobalData<T>>? dataList,
  ]) {
    dataList?.forEach(registerData);
  }

  /// The function that is called when any of the data changes.
  final void Function(T) listener;

  /// All listeners that are registered to this [JoinedGlobalListener].
  final Set<GlobalListener<T>> _listeners = {};

  /// Registers a [GlobalData] to this [JoinedGlobalListener].
  ///
  /// If the [GlobalData] is already registered, this function does nothing.
  void registerData(GlobalData<T> data) {
    if (_listeners.any((listener) => listener.data == data)) return;
    _listeners.add(data.listen(_listener));
  }

  /// Unregisters a [GlobalData] from this [JoinedGlobalListener].
  void removeData(GlobalData<T> data) {
    final listeners = _listeners.where((listener) => listener.data == data);
    if (listeners.isEmpty) return;
    final listener = listeners.first..dispose();
    _listeners.remove(listener);
  }

  void _listener(T data) {
    listener(data);
  }

  /// Disposes this [JoinedGlobalListener].
  void dispose() {
    for (final listener in _listeners) {
      listener.dispose();
    }
    _listeners.clear();
  }
}
