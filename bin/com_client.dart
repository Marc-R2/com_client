import 'dart:async';

import 'package:com/com_server.dart';

import 'service/provider/service_provider.dart';

void main(List<String> arguments) async {
  final comSocket = ComSocket.fromIP(ip: '0.0.0.0', port: 9002);

  await comSocket.init();

  await comSocket.connectClient();

  final ping = PingService(com: comSocket);

  // Repeat task() every second
  var i = 0;
  final timer = Timer.periodic(
    const Duration(milliseconds: 512),
    (timer) async {
      await task(ping);
      i++;
      if (i >= 100) {
        timer.cancel();
      }
    },
  );
}

Future<void> task(PingService ping) async {
  final ms = await ping.ping.request(fields: [ping.ping.msServer]).values.first;

  await Future<void>.delayed(const Duration(seconds: 1));

  print('ms(${ms.value}): $ms');
}
