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
    @JsonKey(name: 'prompt_tokens') required int promptTokens,
    @JsonKey(name: 'completion_tokens') required int completionTokens,
    @JsonKey(name: 'total_tokens') required int totalTokens,
  }) = _Usage;

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);
}

@freezed
class Choice with _$Choice {
  const factory Choice({
    required Message message,
  }) = _Choice;

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
}

@freezed
class Message with _$Message {
  const factory Message({
    required String role,
    required String content,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
