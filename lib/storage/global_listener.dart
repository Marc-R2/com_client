part of '../com_client.dart';

/// [GlobalListener] listens to changes in [GlobalData] and calls the [listener]
/// function when the data changes.
///
/// [GlobalListener]s are automatically disposed when the [GlobalData] is
/// disposed.
///
/// [GlobalListener] is used with [GlobalData] and [GlobalDataController].
///
/// Create a [GlobalListener] with [GlobalData.listen].
class GlobalListener<T> {
  /// Creates a [GlobalListener] that listens to changes in [GlobalData].
  ///
  /// [listener] is the function that is called when the data changes.
  ///
  /// [data] is the [GlobalData] that is listened to.
  GlobalListener(this.listener, this.data) {
    GlobalDataController.registerGlobalListener(this);
  }

  /// The function that is called when the data changes.
  final void Function(T) listener;

  /// The [GlobalData] that this [GlobalListener] listens to.
  final GlobalData<T> data;

  /// The key of the [GlobalData] that this [GlobalListener] listens to.
  String get key => data.key;

  /// get the current value without listening to changes.
  T get value => data.value;

  /// Disposes this [GlobalListener].
  void dispose() {
    GlobalDataController.unregisterGlobalListener(this);
    data.removeListener(this);
  }
}
