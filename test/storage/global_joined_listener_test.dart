import 'package:com_client/com_client.dart';
import 'package:test/test.dart';

void main() {
  group('joined data listening', () {
    test('basic listening to int', () {
      int? mutableValue;

      final data1 = GlobalData.withoutKey(value: 0);
      final data2 = GlobalData.withoutKey(value: 1);

      JoinedGlobalListener<int>.fromList(
        (p0) => mutableValue = p0,
        [data1, data2],
      );

      expect(mutableValue, isNull);
      expect(data1.value, 0);
      expect(data2.value, 1);

      data1.value = 2;

      expect(mutableValue, 2);
      expect(data1.value, 2);
      expect(data2.value, 1);

      data2.value = 3;

      expect(mutableValue, 3);
      expect(data1.value, 2);
      expect(data2.value, 3);
    });

    test('basic listening to dynamic', (){
      dynamic mutableValue;

      final data1 = GlobalData.withoutKey(value: 0);
      final data2 = GlobalData.withoutKey(value: '1');

      JoinedGlobalListener<dynamic>.fromList(
        (p0) => mutableValue = p0,
        [data1, data2],
      );

      expect(mutableValue, isNull);
      expect(data1.value, 0);
      expect(data2.value, '1');

      data1.value = 2;

      expect(mutableValue, 2);
      expect(data1.value, 2);
      expect(data2.value, '1');

      data2.value = '3';

      expect(mutableValue, '3');
      expect(data1.value, 2);
      expect(data2.value, '3');
    });
  });
}
