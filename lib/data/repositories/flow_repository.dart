import 'package:generation_flow_poc/data/interfaces/i_generator_service.dart';
import 'package:generation_flow_poc/data/models/episode_time_enum.dart';
import 'package:generation_flow_poc/data/models/flow_step.dart';

class FlowRepository {
  final IGeneratorService _service;

  const FlowRepository({required IGeneratorService service})
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
    required List<String> titles,
  }) async {
    await _service.finishUserCreationFlow(
      episodeLenght: episodeLenght,
      titles: titles,
    );
  }
}
