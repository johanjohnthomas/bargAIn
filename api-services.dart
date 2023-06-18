import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const String BASE_URL = 'https://api.openai.com/v1/chat';
  static const String API_KEY =
      'ENTER-API-KEY';

  static Future<Map<String, dynamic>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse('$BASE_URL/models'),
        headers: {'Authorization': 'Bearer $API_KEY'},
      );
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } catch (error) {
      print('$error');
      return {};
    }
  }

  static Future<String> sendMessage(String prompt) async {
    String purpose =
        "You are now an AI chatbot for my AI Retail Company called bargAIn, you are called bargAIn buddy, you will only reply to the user only when the users query is related to retail/phones/tablets/accessories, You are not made by OpenAI, you are bargAInBuddy here is the users prompt: ";
    final String apiKey =
        'ENTER-API-KEY'; // Replace with your OpenAI API key

    final Map<String, dynamic> requestData = {
      'model': 'text-davinci-003', // Replace with your desired model
      'prompt': purpose + prompt,
      'max_tokens': 100, // Adjust as needed
      'temperature': 0, // Adjust as needed
    };

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/completions'),
      headers: headers,
      body: jsonEncode(requestData),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to send message');
    }
  }
}
