import 'package:com/com_server.dart';

import 'service/provider/service_provider.dart';

void main(List<String> arguments) async {
  final myService = Service(name: 'client', tasks: []);

  final connect = Connect(type: 'client', service: myService);

  final com = ComDeviceClient.custom(
    ip: '0.0.0.0',
    port: 8001,
    socketPort: 9001,
    connect: connect,
  );

  await com.loadDeviceInfo();

  print(await com.connectClient());

  final prov = ProviderService(com: com);

  final res = prov.services.request(fields: [prov.services.getServices]);

  final res2 = res.values.first;

  print('Res2: ${await res2}');
}
