import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:never_flutter_sample_code/talk_to_chat_gpt/models/chat_gpt_response.dart';

Future<ChatGPTResponse> chatGPT(String content) async {
  final apiKey = dotenv.env['OPENAI_API_KEY']; // 環境変数からAPIキーを取得
  const url = 'https://api.openai.com/v1/chat/completions';
  final headers = {
    'Content-Type': 'application/json; charset=utf-8',
    'Authorization': 'Bearer $apiKey',
  };

  final body = json.encode(
    {
      'model': 'gpt-3.5-turbo',
      'messages': [
        {
          'role': 'user',
          'content': content,
        }
      ],
    },
  );

  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    return ChatGPTResponse.fromJson(
      json.decode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
    ); // JSONをChatGPTResponseに変換
  } else {
    throw Exception('Failed to get response from ChatGPT: ${response.body}');
  }
}
