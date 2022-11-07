import 'package:com/com_client.dart';

class PublicCreateDBTask {
  static const DataType<String> nameArg = DataType(name: 'name');

  static const createTable = FieldData<String>(
    name: 'table',
    args: [nameArg],
  );
}

class PublicDeleteDBTask {
  static const millisecondOnServer = FieldData<int>(
    name: 'millisecondOnServer',
  );
}

class PublicInsertDBTask {
  static const tableName = DataType<String>(name: 'tableName');

  static const values = DataType<Map<String, dynamic>>(name: 'values');

  static const insertRow = FieldData<String>(
    name: 'insertRow',
    args: [tableName, values],
  );
}

class PublicSelectDBTask {
  static const tableName = DataType<String>(name: 'tableName');

  static const ident = DataType<String>(name: 'ident');

  static const values = DataType<Map<String, dynamic>>(name: 'values');

  static const getRowsByValues = FieldData<List<Map<String, dynamic>>>(
    name: 'getRowsByValues',
    args: [values, tableName],
  );
}

class PublicUpdateDBTask {
  static const tableName = DataType<String>(name: 'tableName');

  static const rowIdent = DataType<String>(name: 'rowIdent');

  static const values = DataType<Map<String, dynamic>>(name: 'values');

  static const unsetMissing = DataType<bool>(
    name: 'unsetMissingValues',
    defaultValue: false,
  );

  static const forceSnapshot = DataType<bool>(
    name: 'forceSnapshot',
    defaultValue: true,
  );

  static const updateRow = FieldData<bool>(
    name: 'updateRow',
    args: [values, rowIdent, tableName, unsetMissing, forceSnapshot],
  );
}
