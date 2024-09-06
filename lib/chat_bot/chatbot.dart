import 'package:cxgenie/cxgenie.dart';
import 'package:cxgenie/enums/language.dart';
import 'package:flutter/material.dart';

class Chatbot extends StatelessWidget {
  const Chatbot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: const Center(
          child: Chat(
        botId: '7e4dd37c-6a61-41a6-bfea-3f50f79fcccf',
        userToken: 'USER_TOKEN',
        language: LanguageOptions.vi,
      )),
    );
  }
}
