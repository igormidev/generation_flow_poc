import 'package:generation_flow_poc/data/models/episode_time_enum.dart';
import 'package:generation_flow_poc/data/models/flow_step.dart';
import 'package:generation_flow_poc/data/services/generator_service.dart';

class FlowRepository {
  final GeneratorService _service;

  const FlowRepository({required GeneratorService service})
      : _service = service;

  Future<FlowStep> createFlow() async {
    final response = await _service.getCreationFlow();
    return FlowStep.fromMap(response);
  }

  Future<FlowStep> runFlowStep(String text) async {
    final response = await _service.runCreationFlow(text);
    return FlowStep.fromMap(response);
  }

  Future<void> finishFlow({
    required EEpisodeTime episodeLenght,
    required String title,
  }) async {
    await _service.finishUserCreationFlow(
      episodeLenght: episodeLenght,
      title: title,
    );
  }
}
