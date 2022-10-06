import 'dart:async';
import 'dart:math';

import 'package:com/com_server.dart';

import 'service/provider/service_provider.dart';

void main(List<String> arguments) async {
  final comSocket = ComSocket.fromIP(ip: 'localhost', port: 20000);

  // await comSocket.init();

  await comSocket.connectClient();

  Message.warning(
    title: 'ID: {id}',
    templateValues: {'id': comSocket.id.id},
  );

  final ping = PingService(com: comSocket);

  await task(ping);

  return;
  // Repeat task() every second
  var i = 0;
  Timer.periodic(
    const Duration(milliseconds: 512),
    (timer) async {
      await task(ping);
      i++;
      if (i >= 512) timer.cancel();
    },
  );
}

Future<void> task(PingService ping) async {
  /*final ms = await ping.ping
      .request(
        fields: [ping.ping.wait],
        data: {'wait': Random().nextInt(4096 * 2)},
      )
      .values
      .first;

  await Future<void>.delayed(const Duration(seconds: 1));

  print('ms(${ms.value}): $ms');*/
}
