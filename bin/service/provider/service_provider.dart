
import 'package:com_client/com_client.dart';

class ProviderService extends LocalService {
  ProviderService({required super.com}) : super(service: 'provider');

  late final services = ServicesTask(service: this);
}

class ServicesTask extends LocalTask {
  ServicesTask({required super.service}) : super(task: 'services');

  @override
  List<LocalField<LocalTask>> get fields => [];

  final getServices = const LocalField<ServicesTask>(name: 'getServices');
}