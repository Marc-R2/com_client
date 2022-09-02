import 'dart:async';

import 'package:com/com_server.dart';

import 'service/provider/service_provider.dart';

void main(List<String> arguments) async {
  final comSocket = ComSocket.fromIP(ip: '127.0.0.1', port: 20000);

  // await comSocket.init();

  await comSocket.connectClient();

  Message.warning(
    title: 'ID: {id}',
    templateValues: {'id': comSocket.id.id},
  );

  final ping = PingService(com: comSocket);

  // await task(ping);

  // return;
  // Repeat task() every second
  var i = 0;
  Timer.periodic(
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
