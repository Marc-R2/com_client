part of '../com_client.dart';

abstract class LocalTask {
  const LocalTask({
    required this.service,
    required this.task,
  });

  final LocalService service;

  final String task;

  List<LocalField> get fields;

  Map<String, Future<TaskAnswer>> request({
    required List<LocalField> fields,
    String? origin,
    String serviceVersion = '^',
    String connectType = 'service',
    void Function(TaskAnswer answer)? onComplete,
    Map<String, dynamic> data = const <String, dynamic>{},
    String destination = 'none',
    String? taskID,
  }) {
    return service.request(
      taskName: task,
      fields: fields.map<String>((field) => field.name).toList(),
      origin: origin,
      serviceVersion: serviceVersion,
      connectType: connectType,
      onComplete: onComplete,
      data: data,
      destination: destination,
      taskID: taskID,
    );
  }
}
