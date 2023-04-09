import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_gpt_response.freezed.dart';
part 'chat_gpt_response.g.dart';

@freezed
class ChatGPTResponse with _$ChatGPTResponse {
  const factory ChatGPTResponse({
    required String id,
    required String object,
    required int created,
    required String model,
    required Usage usage,
    required List<Choice> choices,
  }) = _ChatGPTResponse;

  factory ChatGPTResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatGPTResponseFromJson(json);
}

@freezed
class Usage with _$Usage {
  const factory Usage({
    required int prompt_tokens,
    required int completion_tokens,
    required int total_tokens,
  }) = _Usage;

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);
}

@freezed
class Choice with _$Choice {
  const factory Choice({
    required String text,
    required int index,
    dynamic logprobs,
    required String finish_reason,
  }) = _Choice;

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
}
