import 'package:com/com_client.dart';
import 'package:com_client/com_client.dart';

export 'package:log_message/logger.dart';

export 'package:com/com_client.dart';

export 'package:network_util/network_util.dart';

class ComClient {
  ///
  ComClient(List<NetworkDevice> clients) {
    clients.map(_registerCom);
  }

  Future<void> _registerCom(NetworkDevice device) async {
    if ((await device.checkConnection()).exists) {
      final com = ComSocket.fromIP(ip: device.ip, port: device.port);
      await com.init();
      if (com.exists) {
        await com.connectClient();
        _com[device] = com;
      }
    }
  }

  final Map<NetworkDevice, ComSocket> _com = {};

  NetworkDevice? primaryServer;

  ComSocket? get com {
    final server = primaryServer != null &&
            _com[primaryServer] != null &&
            _com[primaryServer]!.ready
        ? primaryServer
        : _com.keys.firstWhere((key) => _com[key]!.ready);

    return _com[server];
  }

  Future<TaskRequest> request(TaskRequest task) async {
    if (com != null) {
      com!.sendRequest(task);
    } else {
      task.complete('root', Response()..failed(6));
    }
    return task;
  }

  Future<TaskAnswer> answer(
    Field<dynamic, Task> field, {
    required Map<String, dynamic> data,
  }) async {
    final task = await request(field.getTask(data: data));
    return task.getField(field.name);
  }
}
