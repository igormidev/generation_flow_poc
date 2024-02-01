import 'dart:math';

import 'package:generation_flow_poc/data/interfaces/i_generator_service.dart';
import 'package:generation_flow_poc/data/models/episode_time_enum.dart';

int mockFlowIndex = 0;

class MockGeneratorService implements IGeneratorService {
  @override
  Future<Map<String, dynamic>> getCreationFlow() async {
    mockFlowIndex = 0;
    final secs = _getRandomInt(1, 2);
    await Future.delayed(Duration(seconds: secs));
    return {
      "screen_state": "start",
      "ui": "What are you interested in?",
    };
  }

  @override
  Future<Map<String, dynamic>> runCreationFlow(String text) async {
    if (text == 'Take me straight to possible titles') {
      mockFlowIndex = 0;
      return {
        "screen_state": "final",
        "ui":
            "Which titles would you like to create? \n [Navigating the Complexities of Anxiety and Depression] \n [The Role of Medication in Managing Mental Health]",
      };
    }

    await Future.delayed(Duration(seconds: _getRandomInt(2, 4)));

    final isDifferentText = 'Show me different answers' == text;
    if (isDifferentText) mockFlowIndex--;

    if (mockFlowIndex == 0) {
      mockFlowIndex++;
      return {
        "screen_state": "questions",
        "ui":
            "Are you at the [Beginner] or [Advanced] stage in your mental health knowledge?",
      };
    } else if (mockFlowIndex == 1) {
      mockFlowIndex++;
      return {
        "screen_state": "questions",
        "ui":
            "What specific area of Wellness interests you? \n [Mental Health] \n [Fitness & Nutrition] \n [Medical Innovations] \n [Public Health Issues]",
      };
    } else {
      mockFlowIndex = 0;
      return {
        "screen_state": "final",
        "ui":
            "Which titles would you like to create? \n [Navigating the Complexities of Anxiety and Depression] \n [The Role of Medication in Managing Mental Health]",
      };
    }
  }

  @override
  Future<void> finishUserCreationFlow({
    required EEpisodeTime episodeLenght,
    required List<String> titles,
  }) async {
    await Future.delayed(Duration(seconds: _getRandomInt(2, 4)));
  }

  int _getRandomInt(int min, int max) {
    return min + Random().nextInt(max - min);
  }
}
