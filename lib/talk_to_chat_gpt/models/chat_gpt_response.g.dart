// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_gpt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatGPTResponse _$$_ChatGPTResponseFromJson(Map<String, dynamic> json) =>
    _$_ChatGPTResponse(
      id: json['id'] as String,
      object: json['object'] as String,
      created: json['created'] as int,
      model: json['model'] as String,
      usage: Usage.fromJson(json['usage'] as Map<String, dynamic>),
      choices: (json['choices'] as List<dynamic>)
          .map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChatGPTResponseToJson(_$_ChatGPTResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'usage': instance.usage,
      'choices': instance.choices,
    };

_$_Usage _$$_UsageFromJson(Map<String, dynamic> json) => _$_Usage(
      promptTokens: json['prompt_tokens'] as int,
      completionTokens: json['completion_tokens'] as int,
      totalTokens: json['total_tokens'] as int,
    );

Map<String, dynamic> _$$_UsageToJson(_$_Usage instance) => <String, dynamic>{
      'prompt_tokens': instance.promptTokens,
      'completion_tokens': instance.completionTokens,
      'total_tokens': instance.totalTokens,
    };

_$_Choice _$$_ChoiceFromJson(Map<String, dynamic> json) => _$_Choice(
      message: Message.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChoiceToJson(_$_Choice instance) => <String, dynamic>{
      'message': instance.message,
    };

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      role: json['role'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };
