part of '../com_client.dart';

class LocalField<T extends LocalTask> {
  const LocalField({required this.name, required this.task});

  final String name;

  final T task;

  TaskRequest? request({
    String? origin,
    String serviceVersion = '^',
    String connectType = 'service',
    void Function(TaskAnswer answer)? onComplete,
    Map<String, dynamic> data = const <String, dynamic>{},
    String destination = 'none',
    String? taskID,
  }) {
    return task.request(
      fields: [this],
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
