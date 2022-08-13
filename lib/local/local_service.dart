part of '../com_client.dart';

abstract class LocalService {
  const LocalService({required this.service, required this.com});

  final String service;

  final ComSocket com;

  Map<String, Future<TaskAnswer>> request({
    required String taskName,
    required List<String> fields,
    String? origin,
    int serviceVersion = 0,
    String connectType = 'service',
    void Function(TaskAnswer answer)? onComplete,
    Map<String, dynamic> data = const <String, dynamic>{},
    String destination = 'none',
    String? taskID,
  }) {
    return com.sendRequest(
      TaskRequest(
        serviceName: service,
        taskName: taskName,
        fields: fields,
        origin: origin ?? 'none',
        serviceVersion: serviceVersion,
        connectType: connectType,
        onComplete: onComplete,
        data: data,
        destination: destination,
        taskID: taskID,
      ),
    );
  }
}
