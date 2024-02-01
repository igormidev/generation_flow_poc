import 'package:generation_flow_poc/data/models/episode_time_enum.dart';

abstract class IGeneratorService {
  Future<Map<String, dynamic>> getCreationFlow();
  Future<Map<String, dynamic>> runCreationFlow(String text);
  Future<void> finishUserCreationFlow({
    required EEpisodeTime episodeLenght,
    required List<String> titles,
  });
}
