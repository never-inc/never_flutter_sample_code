import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:never_flutter_sample_code/talk_to_chat_gpt/models/chat_gpt_response.dart';
import 'package:never_flutter_sample_code/talk_to_chat_gpt/sevices/chat_gpt_service.dart';

void main() {
  test('ChatGPT function returns valid ChatGPTResponse with real API',
      () async {
    await dotenv.load(); // 環境変数をロード
    const prompt = 'サンプルの質問';

    final response = await chatGPT(prompt);

    expect(response, isA<ChatGPTResponse>());
    expect(response.choices[0].text.isNotEmpty, true);
  });
}
