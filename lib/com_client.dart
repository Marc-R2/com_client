import 'package:com_client/com_client.dart';

export 'package:com/com_client.dart';
export 'package:log_message/logger.dart';
export 'package:network_util/network_util.dart';

part 'storage/global_data_controller.dart';

part 'storage/global_data.dart';

part 'storage/global_listener.dart';

class ComClient {
  static void registerClients(List<NetworkDevice> clients) {
    for (final device in clients) {
      _com[device] = ComSocket.fromIP(ip: device.ip, port: device.port);
      _registerCom(device);
    }
  }

  static Future<void> _registerCom(NetworkDevice device) async {
    final com = _com[device];
    if ((await device.checkConnection()).exists && com != null) {
      await com.init();
      if (com.exists) await com.connectClient();
    }
  }

  static final Map<NetworkDevice, ComSocket> _com = {};

  static NetworkDevice? primaryServer;

  static ComSocket? get com {
    final server = primaryServer != null &&
            _com[primaryServer] != null &&
            _com[primaryServer]!.ready
        ? primaryServer
        : _com.keys.firstWhere(
            (key) => _com[key]!.ready,
            orElse: () => _com.keys.first,
          );

    return _com[server];
  }

  static Future<TaskRequest> request(TaskRequest task) async {
    if (com != null) {
      com!.sendRequest(task);
    } else {
      Message.error(title: 'No Com', text: 'No Com available');
      task.complete('root', Response()..failed(6));
    }
    return task;
  }

  static Future<TaskAnswer> answer(
    Field<dynamic> field, {
    Map<String, dynamic>? data,
  }) async {
    final task = await request(field.getTask(data: data ?? {}));
    return task.getField(field.name);
  }
}
