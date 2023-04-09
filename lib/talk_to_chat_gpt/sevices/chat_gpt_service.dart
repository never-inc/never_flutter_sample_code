import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:never_flutter_sample_code/talk_to_chat_gpt/models/chat_gpt_response.dart';

Future<ChatGPTResponse> chatGPT(String prompt) async {
  final apiKey = dotenv.env['OPENAI_API_KEY']; // 環境変数からAPIキーを取得
  const url = 'https://api.openai.com/v1/engines/davinci/completions';
  final headers = {
    'Content-Type': 'application/json; charset=utf-8',
    'Authorization': 'Bearer $apiKey',
  };

  final body = json.encode({
    'prompt':
        prompt, // これは、GPT-3に送信する質問やテキストです。GPT-3は、このプロンプトに基づいて回答や続きのテキストを生成します。
    'max_tokens':
        50, //  これは、GPT-3が生成する最大トークン数を制限するための整数です。これにより、生成されるテキストの長さが制限されます。ただし、あまりにも小さい値を設定すると、生成されるテキストが不完全または意味をなさなくなる可能性があります。
    'n':
        1, // これは、生成されるテキストの候補数を制御する整数です。値が1より大きい場合、GPT-3はn個の異なるテキストを生成し、choices配列に返します。これにより、異なる続きや回答を比較して最適なものを選ぶことができます。
    'stop':
        null, // これは、GPT-3に生成を停止するべきトークンまたはトークンのリストです。生成中にこれらのトークンが検出されると、生成が終了します。これにより、生成されるテキストの内容や構造を制御できます。
    'temperature':
        0.8, // これは、生成されるテキストのランダム性を制御する0から1までの浮動小数点数です。高い値（例えば、0.8）は、生成されるテキストに多様性があることを意味し、低い値（例えば、0.2）は、テキストがより決定論的であることを意味します。つまり、temperatureが高いほど、より多くの異なる回答が生成され、低いほど、モデルの最も確信度の高い回答が生成されます。
  });

  final response =
      await http.post(Uri.parse(url), headers: headers, body: body);
  print(response.body);
  final jsonResponse = json.decode(response.body);

  if (response.statusCode == 200) {
    /// ChatGPTResponse.fromJson(json.decode(utf8.decode(response.bodyBytes)))
    return ChatGPTResponse.fromJson(
      json.decode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
    ); // JSONをChatGPTResponseに変換
  } else {
    throw Exception('Failed to get response from ChatGPT: ${response.body}');
  }
}
