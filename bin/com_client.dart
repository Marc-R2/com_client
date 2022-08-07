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

  final ping = PingService(com: com);

  final ms = await ping.ping.request(fields: [ping.ping.msServer]).values.first;
  final us = await ping.ping.request(fields: [ping.ping.usServer]).values.first;
  final sec =
      await ping.ping.request(fields: [ping.ping.secServer]).values.first;

  await Future<void>.delayed(const Duration(seconds: 1));

  print('ms(${ms.value}): $ms');
  print('us(${us.value}): $us');
  print('sec(${sec.value}): $sec');
}
