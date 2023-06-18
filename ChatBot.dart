import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:intl/intl.dart';
import 'api-services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: 'Main-User');
  final _chatbot = const types.User(id: 'Chat-Bot');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color.fromRGBO(75, 173, 86, 1),
          foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
          title: const Image(
            width: 97.5,
            height: 40.0,
            image: AssetImage("images/bargAIn-Buddy.png"),
          ),
        ),
        body: Container(
          child: Chat(
            theme: DefaultChatTheme(
              inputBackgroundColor: Color.fromRGBO(75, 173, 86, 1),
              primaryColor: Color.fromRGBO(75, 173, 86, 1),
              secondaryColor: Color.fromRGBO(75, 173, 86, 1),
              inputTextColor: const Color.fromRGBO(255, 255, 255, 1),
            ),
            messages: _messages,
            onSendPressed: _handleSendPressed,
            user: _user,
          ),
        ),
      ),
    );
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: 'hi',
      text: message.text,
    );
    printModels();
    _addMessage(textMessage);
    _chatbotResponse(textMessage);
  }

  void printModels() {
    ApiService.getModels().then((response) {
      if (response.containsKey('data')) {
        List<dynamic> models = response['data'];
        print('Available Models:');
        for (var model in models) {
          print('Model ID: ${model['id']}');
          print('Model Object: ${model['object']}');
          print('Model Owned By: ${model['owned_by']}');
          print('----------------------------------');
        }
      } else {
        print('No models found in the response.');
      }
    }).catchError((error) {
      print('Error fetching models: $error');
    });
  }

  void _chatbotResponse(types.TextMessage message) async {
    String finalText = 'Sorry, I didn\'t get that';
    String current = message.text.toLowerCase();
    String finRes = "";
    try {
      await ApiService.sendMessage(message.text).then((res) {
        finRes = res;
      });
      var jsonResponse = jsonDecode(finRes);

      if (jsonResponse['choices'].length > 0) {
        finalText = jsonResponse['choices'][0]['text'];
        print("Generated Response: $finalText");
      }
      finalText = finalText.replaceAll("?", "");
      finalText = finalText.trim();
    } catch (error) {
      print("Error: $error");
      // Handle the error if needed
    }

    final textMessage = types.TextMessage(
      author: _chatbot,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: 'hi',
      text: finalText,
    );
    _addMessage(textMessage);
  }
}
