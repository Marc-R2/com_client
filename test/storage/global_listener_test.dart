import 'package:com_client/com_client.dart';
import 'package:test/test.dart';

void main() {
  group('global listener', () {
    test('basic listening', () {
      int? mutableValue;

      final data = GlobalData.withoutKey(value: 0);
      final listener = data.listen((p0) => mutableValue = p0);

      expect(mutableValue, isNull);
      expect(listener.key, isNotNull);
      expect(data.key, isNotNull);
      expect(data.key, listener.key);
      expect(data.value, 0);

      data.value = 1;

      expect(mutableValue, 1);
      expect(data.value, 1);

      data.value = 2;

      expect(mutableValue, 2);
      expect(data.value, 2);
    });

    test('change value without notify', () {
      int? mutableValue;

      final data = GlobalData.withoutKey(value: 0);
      final listener = data.listen((p0) => mutableValue = p0);

      expect(mutableValue, isNull);
      expect(listener.key, isNotNull);
      expect(data.key, isNotNull);
      expect(data.key, listener.key);
      expect(data.value, 0);

      data.value = 1;

      expect(mutableValue, 1);
      expect(data.value, 1);

      data.setValue(2, notify: false);

      expect(mutableValue, 1);
      expect(data.value, 2);
    });
  });
}
