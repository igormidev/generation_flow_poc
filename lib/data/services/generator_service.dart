import 'dart:math';
import 'dart:convert';
import 'package:generation_flow_poc/data/interfaces/i_generator_service.dart';
import 'package:http/http.dart' as http;
import 'package:generation_flow_poc/data/models/episode_time_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

void logText(text) {
  print(text);
}

class GeneratorService implements IGeneratorService {
  final String _baseUrl = 'https://bf93-89-138-14-225.ngrok-free.app';

  @override
  Future<Map<String, dynamic>> getCreationFlow() async {
    Uri url = Uri.parse('$_baseUrl/get_creation_flow');
    final rawResponse = await callGetAPI(url);
    final dynamic response = jsonDecode(rawResponse) as Map<String, dynamic>;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("creation_flow_id", response['creation_flow_id']);
    return response['screen'];
  }

  @override
  Future<Map<String, dynamic>> runCreationFlow(String text) async {
    Uri url = Uri.parse('$_baseUrl/run_creation_flow');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? creationFlowId = prefs.getString("creation_flow_id");
    var data = {"creation_flow_id": creationFlowId!, "answer": text};
    final dynamic response = await callPostAPI(url, data);
    return response;
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

  // Method to send events to the backend
  Future<dynamic> callGetAPI(Uri url) async {
    logText("Calling: $url");

    // String? token = await getFirebaseAuthToken();

    var headers = {
      "Authorization": "Bearer token",
      "Content-Type": "application/json"
    };

    try {
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        // Handle successful response
        logText("API Called successfully: $url");
        final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
        return jsonResponse;
      } else {
        // Handle error
        logText("Failed to call the API. Status code: ${response.statusCode}");
        return '';
      }
    } catch (e) {
      // Handle exception
      logText("Error while calling api: $e");
      return '';
    }
  }

  // Method to send events to the backend
  Future<dynamic> callPostAPI(Uri url, dynamic data) async {
    logText("Calling: $url");

    // String? token = await getFirebaseAuthToken();

    var headers = {
      "Authorization": "Bearer token",
      "Content-Type": "application/json"
    };

    http.Response response;
    try {
      response = await http.post(url, body: jsonEncode(data), headers: headers);
      if (response.statusCode == 200) {
        // Handle successful response
        logText("API Called successfully: $url");
        final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
        return jsonResponse;
      } else {
        // Handle error
        logText("Failed to call the API. Status code: ${response.statusCode}");
      }
    } catch (e) {
      // Handle exception
      logText("Error while calling api: $e");
    }
    return '';
  }
}
