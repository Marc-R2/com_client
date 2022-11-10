import 'package:com_client/com_client.dart';
import 'package:test/test.dart';

void main() {
  group('basic set/get', () {
    group('with key and value', () {
      test('set/get int', () {
        final data = GlobalData<int>(key: 'test', value: 0);
        expect(data.value, 0);
        data.value = 1;
        expect(data.value, 1);
      });

      test('set/get double', () {
        final data = GlobalData<double>(key: 'test', value: 0);
        expect(data.value, 0.0);
        data.value = 1.0;
        expect(data.value, 1.0);
      });

      test('set/get String', () {
        final data = GlobalData<String>(key: 'test', value: '');
        expect(data.value, '');
        data.value = 'test';
        expect(data.value, 'test');
      });

      test('set/get bool', () {
        final data = GlobalData<bool>(key: 'test', value: false);
        expect(data.value, false);
        data.value = true;
        expect(data.value, true);
      });

      test('set/get List<int>', () {
        final data = GlobalData<List<int>>(key: 'test', value: []);
        expect(data.value, <int>[]);
        data.value = [1, 2, 3];
        expect(data.value, [1, 2, 3]);
      });

      test('set/get List<double>', () {
        final data = GlobalData<List<double>>(key: 'test', value: []);
        expect(data.value, <double>[]);
        data.value = [1.0, 2.0, 3.0];
        expect(data.value, [1.0, 2.0, 3.0]);
      });

      test('set/get List<String>', () {
        final data = GlobalData<List<String>>(key: 'test', value: []);
        expect(data.value, <String>[]);
        data.value = ['1', '2', '3'];
        expect(data.value, ['1', '2', '3']);
      });

      test('set/get List<bool>', () {
        final data = GlobalData<List<bool>>(key: 'test', value: []);
        expect(data.value, <bool>[]);
        data.value = [true, false, true];
        expect(data.value, [true, false, true]);
      });

      test('set/get Map<String, int>', () {
        final data = GlobalData<Map<String, int>>(key: 'test', value: {});
        expect(data.value, <String, int>{});
        data.value = {'1': 1, '2': 2, '3': 3};
        expect(data.value, {'1': 1, '2': 2, '3': 3});
      });

      test('set/get Map<String, double>', () {
        final data = GlobalData<Map<String, double>>(key: 'test', value: {});
        expect(data.value, <String, double>{});
        data.value = {'1': 1.0, '2': 2.0, '3': 3.0};
        expect(data.value, {'1': 1.0, '2': 2.0, '3': 3.0});
      });

      test('set/get Map<String, String>', () {
        final data = GlobalData<Map<String, String>>(key: 'test', value: {});
        expect(data.value, <String, String>{});
        data.value = {'1': '1', '2': '2', '3': '3'};
        expect(data.value, {'1': '1', '2': '2', '3': '3'});
      });

      test('set/get Map<String, bool>', () {
        final data = GlobalData<Map<String, bool>>(key: 'test', value: {});
        expect(data.value, <String, bool>{});
        data.value = {'1': true, '2': false, '3': true};
        expect(data.value, {'1': true, '2': false, '3': true});
      });

      test('set/get Map<String, List<int>>', () {
        final data = GlobalData<Map<String, List<int>>>(key: 'test', value: {});
        expect(data.value, <String, List<int>>{});
        data.value = {
          '1': [1, 2, 3],
          '2': [4, 5, 6],
          '3': [7, 8, 9]
        };
        expect(data.value, {
          '1': [1, 2, 3],
          '2': [4, 5, 6],
          '3': [7, 8, 9]
        });
      });
    });

    group('with value and same type key collision', () {
      test('set/get same type int', () {
        final data1 = GlobalData<int>(key: 'test', value: 1);
        final data2 = GlobalData<int>(key: 'test', value: 2);

        expect(data1.value, 2);
        expect(data2.value, 2);

        data1.value = 3;

        expect(data1.value, 3);
        expect(data2.value, 3);

        data2.value = 4;

        expect(data1.value, 4);
        expect(data2.value, 4);
      });

      test('set/get same type double', () {
        final data1 = GlobalData<double>(key: 'test', value: 1);
        final data2 = GlobalData<double>(key: 'test', value: 2);

        expect(data1.value, 2.0);
        expect(data2.value, 2.0);

        data1.value = 3.0;

        expect(data1.value, 3.0);
        expect(data2.value, 3.0);

        data2.value = 4.0;

        expect(data1.value, 4.0);
        expect(data2.value, 4.0);
      });

      test('set/get same type String', () {
        final data1 = GlobalData<String>(key: 'test', value: '1');
        final data2 = GlobalData<String>(key: 'test', value: '2');

        expect(data1.value, '2');
        expect(data2.value, '2');

        data1.value = '3';

        expect(data1.value, '3');
        expect(data2.value, '3');

        data2.value = '4';

        expect(data1.value, '4');
        expect(data2.value, '4');
      });

      test('set/get same type bool', () {
        final data1 = GlobalData<bool>(key: 'test', value: true);
        final data2 = GlobalData<bool>(key: 'test', value: false);

        expect(data1.value, false);
        expect(data2.value, false);

        data1.value = true;

        expect(data1.value, true);
        expect(data2.value, true);

        data2.value = false;

        expect(data1.value, false);
        expect(data2.value, false);
      });

      test('set/get same type List<int>', () {
        final data1 = GlobalData<List<int>>(key: 'test', value: [1, 2, 3]);
        final data2 = GlobalData<List<int>>(key: 'test', value: [4, 5, 6]);

        expect(data1.value, [4, 5, 6]);
        expect(data2.value, [4, 5, 6]);

        data1.value = [7, 8, 9];

        expect(data1.value, [7, 8, 9]);
        expect(data2.value, [7, 8, 9]);

        data2.value = [10, 11, 12];

        expect(data1.value, [10, 11, 12]);
        expect(data2.value, [10, 11, 12]);
      });

      test('set/get same type List<double>', () {
        final data1 = GlobalData<List<double>>(key: 'test', value: [1.0, 2.0, 3.0]);
        final data2 = GlobalData<List<double>>(key: 'test', value: [4.0, 5.0, 6.0]);

        expect(data1.value, [4.0, 5.0, 6.0]);
        expect(data2.value, [4.0, 5.0, 6.0]);

        data1.value = [7.0, 8.0, 9.0];

        expect(data1.value, [7.0, 8.0, 9.0]);
        expect(data2.value, [7.0, 8.0, 9.0]);

        data2.value = [10.0, 11.0, 12.0];

        expect(data1.value, [10.0, 11.0, 12.0]);
        expect(data2.value, [10.0, 11.0, 12.0]);
      });

      test('set/get same type List<String>', () {
        final data1 = GlobalData<List<String>>(key: 'test', value: ['1', '2', '3']);
        final data2 = GlobalData<List<String>>(key: 'test', value: ['4', '5', '6']);

        expect(data1.value, ['4', '5', '6']);
        expect(data2.value, ['4', '5', '6']);

        data1.value = ['7', '8', '9'];

        expect(data1.value, ['7', '8', '9']);
        expect(data2.value, ['7', '8', '9']);

        data2.value = ['10', '11', '12'];

        expect(data1.value, ['10', '11', '12']);
        expect(data2.value, ['10', '11', '12']);
      });

      test('set/get same type List<bool>', () {
        final data1 = GlobalData<List<bool>>(key: 'test', value: [true, false, true]);
        final data2 = GlobalData<List<bool>>(key: 'test', value: [false, true, false]);

        expect(data1.value, [false, true, false]);
        expect(data2.value, [false, true, false]);

        data1.value = [true, false, true];

        expect(data1.value, [true, false, true]);
        expect(data2.value, [true, false, true]);

        data2.value = [false, true, false];

        expect(data1.value, [false, true, false]);
        expect(data2.value, [false, true, false]);
      });

      test('set/get same type Map<int, int>', () {
        final data1 = GlobalData<Map<int, int>>(key: 'test', value: {1: 1, 2: 2, 3: 3});
        final data2 = GlobalData<Map<int, int>>(key: 'test', value: {4: 4, 5: 5, 6: 6});

        expect(data1.value, {4: 4, 5: 5, 6: 6});
        expect(data2.value, {4: 4, 5: 5, 6: 6});

        data1.value = {7: 7, 8: 8, 9: 9};

        expect(data1.value, {7: 7, 8: 8, 9: 9});
        expect(data2.value, {7: 7, 8: 8, 9: 9});

        data2.value = {10: 10, 11: 11, 12: 12};

        expect(data1.value, {10: 10, 11: 11, 12: 12});
        expect(data2.value, {10: 10, 11: 11, 12: 12});
      });

      test('set/get same type Map<int, double>', () {
        final data1 = GlobalData<Map<int, double>>(key: 'test', value: {1: 1.0, 2: 2.0, 3: 3.0});
        final data2 = GlobalData<Map<int, double>>(key: 'test', value: {4: 4.0, 5: 5.0, 6: 6.0});

        expect(data1.value, {4: 4.0, 5: 5.0, 6: 6.0});
        expect(data2.value, {4: 4.0, 5: 5.0, 6: 6.0});

        data1.value = {7: 7.0, 8: 8.0, 9: 9.0};

        expect(data1.value, {7: 7.0, 8: 8.0, 9: 9.0});
        expect(data2.value, {7: 7.0, 8: 8.0, 9: 9.0});

        data2.value = {10: 10.0, 11: 11.0, 12: 12.0};

        expect(data1.value, {10: 10.0, 11: 11.0, 12: 12.0});
        expect(data2.value, {10: 10.0, 11: 11.0, 12: 12.0});
      });

      test('set/get same type Map<int, String>', () {
        final data1 = GlobalData<Map<int, String>>(key: 'test', value: {1: '1', 2: '2', 3: '3'});
        final data2 = GlobalData<Map<int, String>>(key: 'test', value: {4: '4', 5: '5', 6: '6'});

        expect(data1.value, {4: '4', 5: '5', 6: '6'});
        expect(data2.value, {4: '4', 5: '5', 6: '6'});

        data1.value = {7: '7', 8: '8', 9: '9'};

        expect(data1.value, {7: '7', 8: '8', 9: '9'});
        expect(data2.value, {7: '7', 8: '8', 9: '9'});

        data2.value = {10: '10', 11: '11', 12: '12'};

        expect(data1.value, {10: '10', 11: '11', 12: '12'});
        expect(data2.value, {10: '10', 11: '11', 12: '12'});
      });

      test('set/get same type Map<int, bool>', () {
        final data1 = GlobalData<Map<int, bool>>(key: 'test', value: {1: true, 2: false, 3: true});
        final data2 = GlobalData<Map<int, bool>>(key: 'test', value: {4: false, 5: true, 6: false});

        expect(data1.value, {4: false, 5: true, 6: false});
        expect(data2.value, {4: false, 5: true, 6: false});

        data1.value = {7: true, 8: false, 9: true};

        expect(data1.value, {7: true, 8: false, 9: true});
        expect(data2.value, {7: true, 8: false, 9: true});

        data2.value = {10: false, 11: true, 12: false};

        expect(data1.value, {10: false, 11: true, 12: false});
        expect(data2.value, {10: false, 11: true, 12: false});
      });

      test('set/get same type Map<double, int>', () {
        final data1 = GlobalData<Map<double, int>>(key: 'test', value: {1.0: 1, 2.0: 2, 3.0: 3});
        final data2 = GlobalData<Map<double, int>>(key: 'test', value: {4.0: 4, 5.0: 5, 6.0: 6});

        expect(data1.value, {4.0: 4, 5.0: 5, 6.0: 6});
        expect(data2.value, {4.0: 4, 5.0: 5, 6.0: 6});

        data1.value = {7.0: 7, 8.0: 8, 9.0: 9};

        expect(data1.value, {7.0: 7, 8.0: 8, 9.0: 9});
        expect(data2.value, {7.0: 7, 8.0: 8, 9.0: 9});

        data2.value = {10.0: 10, 11.0: 11, 12.0: 12};

        expect(data1.value, {10.0: 10, 11.0: 11, 12.0: 12});
        expect(data2.value, {10.0: 10, 11.0: 11, 12.0: 12});
      });
    });

    group('with value and diff type key collision', () {
      test('set/get diff type int / double', () {
        final data1 = GlobalData<int>(key: 'test', value: 1);
        final data2 = GlobalData<double>(key: 'test', value: 2);

        expect(data1.value, 1);
        expect(data2.value, 2);

        data1.value = 3;

        expect(data1.value, 3);
        expect(data2.value, 2);

        data2.value = 4;

        expect(data1.value, 3);
        expect(data2.value, 4);

        data1.value = 5;
        data2.value = 6;

        expect(data1.value, 5);
        expect(data2.value, 6);
      });

      test('set/get diff type int / String', () {
        final data1 = GlobalData<int>(key: 'test', value: 1);
        final data2 = GlobalData<String>(key: 'test', value: '2');

        expect(data1.value, 1);
        expect(data2.value, '2');

        data1.value = 3;

        expect(data1.value, 3);
        expect(data2.value, '2');

        data2.value = '4';

        expect(data1.value, 3);
        expect(data2.value, '4');

        data1.value = 5;
        data2.value = '6';

        expect(data1.value, 5);
        expect(data2.value, '6');
      });

      test('set/get diff type int / bool', () {
        final data1 = GlobalData<int>(key: 'test', value: 1);
        final data2 = GlobalData<bool>(key: 'test', value: true);

        expect(data1.value, 1);
        expect(data2.value, true);

        data1.value = 3;

        expect(data1.value, 3);
        expect(data2.value, true);

        data2.value = false;

        expect(data1.value, 3);
        expect(data2.value, false);

        data1.value = 5;
        data2.value = true;

        expect(data1.value, 5);
        expect(data2.value, true);
      });

      test('set/get diff type double / String', () {
        final data1 = GlobalData<double>(key: 'test', value: 1.0);
        final data2 = GlobalData<String>(key: 'test', value: '2');

        expect(data1.value, 1.0);
        expect(data2.value, '2');

        data1.value = 3.0;

        expect(data1.value, 3.0);
        expect(data2.value, '2');

        data2.value = '4';

        expect(data1.value, 3.0);
        expect(data2.value, '4');

        data1.value = 5.0;
        data2.value = '6';

        expect(data1.value, 5.0);
        expect(data2.value, '6');
      });

      test('set/get diff type double / bool', () {
        final data1 = GlobalData<double>(key: 'test', value: 1.0);
        final data2 = GlobalData<bool>(key: 'test', value: true);

        expect(data1.value, 1.0);
        expect(data2.value, true);

        data1.value = 3.0;

        expect(data1.value, 3.0);
        expect(data2.value, true);

        data2.value = false;

        expect(data1.value, 3.0);
        expect(data2.value, false);

        data1.value = 5.0;
        data2.value = true;

        expect(data1.value, 5.0);
        expect(data2.value, true);
      });

      test('set/get diff type String / bool', () {
        final data1 = GlobalData<String>(key: 'test', value: '1');
        final data2 = GlobalData<bool>(key: 'test', value: true);

        expect(data1.value, '1');
        expect(data2.value, true);

        data1.value = '3';

        expect(data1.value, '3');
        expect(data2.value, true);

        data2.value = false;

        expect(data1.value, '3');
        expect(data2.value, false);

        data1.value = '5';
        data2.value = true;

        expect(data1.value, '5');
        expect(data2.value, true);
      });

      test('set/get diff type List<int> / List<double>', () {
        final data1 = GlobalData<List<int>>(key: 'test', value: [1, 2, 3]);
        final data2 = GlobalData<List<double>>(key: 'test', value: [4.0, 5.0, 6.0]);

        expect(data1.value, [1, 2, 3]);
        expect(data2.value, [4.0, 5.0, 6.0]);

        data1.value = [7, 8, 9];

        expect(data1.value, [7, 8, 9]);
        expect(data2.value, [4.0, 5.0, 6.0]);

        data2.value = [10.0, 11.0, 12.0];

        expect(data1.value, [7, 8, 9]);
        expect(data2.value, [10.0, 11.0, 12.0]);

        data1.value = [13, 14, 15];
        data2.value = [16.0, 17.0, 18.0];

        expect(data1.value, [13, 14, 15]);
        expect(data2.value, [16.0, 17.0, 18.0]);
      });
    });

    group('without key', () {
      test('set/get keyless int', () {
        final data1 = GlobalData<int>.withoutKey(value: 1);

        expect(data1.value, 1);
        data1.value = 2;
        expect(data1.value, 2);
        data1.value = 3;
        expect(data1.value, 3);
      });

      test('set/get keyless double', () {
        final data1 = GlobalData<double>.withoutKey(value: 1.0);

        expect(data1.value, 1.0);
        data1.value = 2.0;
        expect(data1.value, 2.0);
        data1.value = 3.0;
        expect(data1.value, 3.0);
      });

      test('set/get keyless String', () {
        final data1 = GlobalData<String>.withoutKey(value: '1');

        expect(data1.value, '1');
        data1.value = '2';
        expect(data1.value, '2');
        data1.value = '3';
        expect(data1.value, '3');
      });

      test('set/get keyless bool', () {
        final data1 = GlobalData<bool>.withoutKey(value: true);

        expect(data1.value, true);
        data1.value = false;
        expect(data1.value, false);
        data1.value = true;
        expect(data1.value, true);
      });

      test('set/get keyless List<int>', () {
        final data1 = GlobalData<List<int>>.withoutKey(value: [1, 2, 3]);

        expect(data1.value, [1, 2, 3]);
        data1.value = [4, 5, 6];
        expect(data1.value, [4, 5, 6]);
        data1.value = [7, 8, 9];
        expect(data1.value, [7, 8, 9]);
      });

      test('set/get keyless List<double>', () {
        final data1 = GlobalData<List<double>>.withoutKey(value: [1.0, 2.0, 3.0]);

        expect(data1.value, [1.0, 2.0, 3.0]);
        data1.value = [4.0, 5.0, 6.0];
        expect(data1.value, [4.0, 5.0, 6.0]);
        data1.value = [7.0, 8.0, 9.0];
        expect(data1.value, [7.0, 8.0, 9.0]);
      });

      test('set/get keyless List<String>', () {
        final data1 = GlobalData<List<String>>.withoutKey(value: ['1', '2', '3']);

        expect(data1.value, ['1', '2', '3']);
        data1.value = ['4', '5', '6'];
        expect(data1.value, ['4', '5', '6']);
        data1.value = ['7', '8', '9'];
        expect(data1.value, ['7', '8', '9']);
      });

      test('set/get keyless List<bool>', () {
        final data1 = GlobalData<List<bool>>.withoutKey(value: [true, false, true]);

        expect(data1.value, [true, false, true]);
        data1.value = [false, true, false];
        expect(data1.value, [false, true, false]);
        data1.value = [true, false, true];
        expect(data1.value, [true, false, true]);
      });

      test('set/get keyless List<dynamic>', () {
        final data1 = GlobalData<List<dynamic>>.withoutKey(value: [1, 2.0, '3', true]);

        expect(data1.value, [1, 2.0, '3', true]);
        data1.value = [4, 5.0, '6', false];
        expect(data1.value, [4, 5.0, '6', false]);
        data1.value = [7, 8.0, '9', true];
        expect(data1.value, [7, 8.0, '9', true]);
      });

      test('set/get keyless Map<String, dynamic>', () {
        final data1 = GlobalData<Map<String, dynamic>>.withoutKey(value: {'1': 1, '2': 2.0, '3': '3', '4': true});

        expect(data1.value, {'1': 1, '2': 2.0, '3': '3', '4': true});
        data1.value = {'5': 4, '6': 5.0, '7': '6', '8': false};
        expect(data1.value, {'5': 4, '6': 5.0, '7': '6', '8': false});
        data1.value = {'9': 7, '10': 8.0, '11': '9', '12': true};
        expect(data1.value, {'9': 7, '10': 8.0, '11': '9', '12': true});
      });

      test('set/get keyless Map<String, int>', () {
        final data1 = GlobalData<Map<String, int>>.withoutKey(value: {'1': 1, '2': 2, '3': 3});

        expect(data1.value, {'1': 1, '2': 2, '3': 3});
        data1.value = {'4': 4, '5': 5, '6': 6};
        expect(data1.value, {'4': 4, '5': 5, '6': 6});
        data1.value = {'7': 7, '8': 8, '9': 9};
        expect(data1.value, {'7': 7, '8': 8, '9': 9});
      });

      test('set/get keyless Map<String, double>', () {
        final data1 = GlobalData<Map<String, double>>.withoutKey(value: {'1': 1.0, '2': 2.0, '3': 3.0});

        expect(data1.value, {'1': 1.0, '2': 2.0, '3': 3.0});
        data1.value = {'4': 4.0, '5': 5.0, '6': 6.0};
        expect(data1.value, {'4': 4.0, '5': 5.0, '6': 6.0});
        data1.value = {'7': 7.0, '8': 8.0, '9': 9.0};
        expect(data1.value, {'7': 7.0, '8': 8.0, '9': 9.0});
      });

      test('set/get keyless Map<String, String>', () {
        final data1 = GlobalData<Map<String, String>>.withoutKey(value: {'1': '1', '2': '2', '3': '3'});

        expect(data1.value, {'1': '1', '2': '2', '3': '3'});
        data1.value = {'4': '4', '5': '5', '6': '6'};
        expect(data1.value, {'4': '4', '5': '5', '6': '6'});
        data1.value = {'7': '7', '8': '8', '9': '9'};
        expect(data1.value, {'7': '7', '8': '8', '9': '9'});
      });

      test('set/get keyless Map<String, bool>', () {
        final data1 = GlobalData<Map<String, bool>>.withoutKey(value: {'1': true, '2': false, '3': true});

        expect(data1.value, {'1': true, '2': false, '3': true});
        data1.value = {'4': false, '5': true, '6': false};
        expect(data1.value, {'4': false, '5': true, '6': false});
        data1.value = {'7': true, '8': false, '9': true};
        expect(data1.value, {'7': true, '8': false, '9': true});
      });
    });
  });
}
