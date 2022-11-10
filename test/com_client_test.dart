import 'package:test/test.dart';
import 'storage/global_data_controller_test.dart' as global_data_controller;
import 'storage/global_data_test.dart' as global_data;
import 'storage/global_joined_listener_test.dart' as global_joined_listener;
import 'storage/global_listener_test.dart' as global_listener;

void main() {
  group('com client', () {
    global_data.main();
    global_data_controller.main();
    global_joined_listener.main();
    global_listener.main();
  });
}
