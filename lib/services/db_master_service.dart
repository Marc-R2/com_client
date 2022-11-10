import 'package:com/com.dart';

class PublicDBMasterService {
  static const data = ServiceData(
    name: 'dbMaster',
    version: '0.0.1',
    authLevel: AuthLevel.public,
    devLevel: DevLevel.stable,
    secureLevel: SecureLevel.none,
  );

  static const create = TaskData(name: 'create', parent: data);

  static const insert = TaskData(name: 'insert', parent: data);

  static const delete = TaskData(name: 'delete', parent: data);

  static const update = TaskData(name: 'update', parent: data);

  static const select = TaskData(name: 'select', parent: data);
}

class PublicCreateDBTask {
  static const DataType<String> nameArg = DataType(name: 'name');

  static const createTable = FieldData<String>(
    name: 'table',
    args: [nameArg],
    parent: PublicDBMasterService.create,
  );
}

class PublicDeleteDBTask {
  static const millisecondOnServer = FieldData<int>(
    name: 'millisecondOnServer',
    parent: PublicDBMasterService.delete,
  );
}

class PublicInsertDBTask {
  static const tableName = DataType<String>(name: 'tableName');

  static const values = DataType<Map<String, dynamic>>(name: 'values');

  static const insertRow = FieldData<String>(
    name: 'insertRow',
    args: [tableName, values],
    parent: PublicDBMasterService.create,
  );
}

class PublicSelectDBTask {
  static const tableName = DataType<String>(name: 'tableName');

  static const ident = DataType<String>(name: 'ident');

  static const values = DataType<Map<String, dynamic>>(name: 'values');

  static const getRowsByValues = FieldData<List<Map<String, dynamic>>>(
    name: 'getRowsByValues',
    args: [values, tableName],
    parent: PublicDBMasterService.select,
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
    parent: PublicDBMasterService.update,
  );
}
