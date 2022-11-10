import 'package:com_client/com_client.dart';
import 'package:test/test.dart';

void main() {
  group('GlobalDataController', () {
    group('set/get global data', () {
      test('get int without init', () {
        var failed = false;
        try {
          GlobalDataController.getGlobalData<int>(
            'this should not be used anywhere else #001',
          );
        } catch (e) {
          expect(e, isNotNull);
          failed = true;
        }
        expect(failed, true);
      });

      test('get int with init', () {
        GlobalDataController.setGlobalData<int>('test', 0);
        final i = GlobalDataController.getGlobalData<int>('test');
        expect(i, isNotNull);
        expect(i, 0);
      });

      test('get int with init and change', () {
        GlobalDataController.setGlobalData<int>('test', 0);
        final i = GlobalDataController.getGlobalData<int>('test');
        expect(i, isNotNull);
        expect(i, 0);

        GlobalDataController.setGlobalData<int>('test', 1);
        final i2 = GlobalDataController.getGlobalData<int>('test');
        expect(i2, isNotNull);
        expect(i2, 1);
      });
    });
  });
}
