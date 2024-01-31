import 'dart:math';

import 'package:generation_flow_poc/data/models/episode_time_enum.dart';

class GeneratorService {
  Future<Map<String, dynamic>> getCreationFlow() async {
    _mockFlowIndex = 0;
    final secs = _getRandomInt(1, 2);
    await Future.delayed(Duration(seconds: secs));
    return {
      "screen_state": "start",
      "ui": "What are you interested in?",
    };
  }

  int _mockFlowIndex = 0;
  Future<Map<String, dynamic>> runCreationFlow(String text) async {
    if (text == 'Skip to Titles') {
      return {
        "screen_state": "final",
        "ui":
            "Which titles would you like to create? \n [Navigating the Complexities of Anxiety and Depression] \n [The Role of Medication in Managing Mental Health]",
      };
    }

    await Future.delayed(Duration(seconds: _getRandomInt(2, 4)));
    if (_mockFlowIndex == 0) {
      _mockFlowIndex++;
      return {
        "screen_state": "questions",
        "ui":
            "Are you at the [Beginner] or [Advanced] stage in your mental health knowledge?",
      };
    } else if (_mockFlowIndex == 1) {
      _mockFlowIndex++;
      return {
        "screen_state": "questions",
        "ui":
            "What specific area of Wellness interests you? \n [Mental Health] \n [Fitness & Nutrition] \n [Medical Innovations] \n [Public Health Issues]",
      };
    } else {
      _mockFlowIndex = 0;
      return {
        "screen_state": "final",
        "ui":
            "Which titles would you like to create? \n [Navigating the Complexities of Anxiety and Depression] \n [The Role of Medication in Managing Mental Health]",
      };
    }
  }

  Future<void> finishUserCreationFlow({
    required EEpisodeTime episodeLenght,
    required String title,
  }) async {
    await Future.delayed(Duration(seconds: _getRandomInt(2, 4)));
  }

  int _getRandomInt(int min, int max) {
    return min + Random().nextInt(max - min);
  }
}
