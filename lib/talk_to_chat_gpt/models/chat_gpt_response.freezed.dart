// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_gpt_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatGPTResponse _$ChatGPTResponseFromJson(Map<String, dynamic> json) {
  return _ChatGPTResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatGPTResponse {
  String get id => throw _privateConstructorUsedError;
  String get object => throw _privateConstructorUsedError;
  int get created => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  Usage get usage => throw _privateConstructorUsedError;
  List<Choice> get choices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatGPTResponseCopyWith<ChatGPTResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatGPTResponseCopyWith<$Res> {
  factory $ChatGPTResponseCopyWith(
          ChatGPTResponse value, $Res Function(ChatGPTResponse) then) =
      _$ChatGPTResponseCopyWithImpl<$Res, ChatGPTResponse>;
  @useResult
  $Res call(
      {String id,
      String object,
      int created,
      String model,
      Usage usage,
      List<Choice> choices});

  $UsageCopyWith<$Res> get usage;
}

/// @nodoc
class _$ChatGPTResponseCopyWithImpl<$Res, $Val extends ChatGPTResponse>
    implements $ChatGPTResponseCopyWith<$Res> {
  _$ChatGPTResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? created = null,
    Object? model = null,
    Object? usage = null,
    Object? choices = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as Usage,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Choice>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsageCopyWith<$Res> get usage {
    return $UsageCopyWith<$Res>(_value.usage, (value) {
      return _then(_value.copyWith(usage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChatGPTResponseCopyWith<$Res>
    implements $ChatGPTResponseCopyWith<$Res> {
  factory _$$_ChatGPTResponseCopyWith(
          _$_ChatGPTResponse value, $Res Function(_$_ChatGPTResponse) then) =
      __$$_ChatGPTResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String object,
      int created,
      String model,
      Usage usage,
      List<Choice> choices});

  @override
  $UsageCopyWith<$Res> get usage;
}

/// @nodoc
class __$$_ChatGPTResponseCopyWithImpl<$Res>
    extends _$ChatGPTResponseCopyWithImpl<$Res, _$_ChatGPTResponse>
    implements _$$_ChatGPTResponseCopyWith<$Res> {
  __$$_ChatGPTResponseCopyWithImpl(
      _$_ChatGPTResponse _value, $Res Function(_$_ChatGPTResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? created = null,
    Object? model = null,
    Object? usage = null,
    Object? choices = null,
  }) {
    return _then(_$_ChatGPTResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as Usage,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Choice>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatGPTResponse implements _ChatGPTResponse {
  const _$_ChatGPTResponse(
      {required this.id,
      required this.object,
      required this.created,
      required this.model,
      required this.usage,
      required final List<Choice> choices})
      : _choices = choices;

  factory _$_ChatGPTResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ChatGPTResponseFromJson(json);

  @override
  final String id;
  @override
  final String object;
  @override
  final int created;
  @override
  final String model;
  @override
  final Usage usage;
  final List<Choice> _choices;
  @override
  List<Choice> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  String toString() {
    return 'ChatGPTResponse(id: $id, object: $object, created: $created, model: $model, usage: $usage, choices: $choices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatGPTResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.usage, usage) || other.usage == usage) &&
            const DeepCollectionEquality().equals(other._choices, _choices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, object, created, model,
      usage, const DeepCollectionEquality().hash(_choices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatGPTResponseCopyWith<_$_ChatGPTResponse> get copyWith =>
      __$$_ChatGPTResponseCopyWithImpl<_$_ChatGPTResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatGPTResponseToJson(
      this,
    );
  }
}

abstract class _ChatGPTResponse implements ChatGPTResponse {
  const factory _ChatGPTResponse(
      {required final String id,
      required final String object,
      required final int created,
      required final String model,
      required final Usage usage,
      required final List<Choice> choices}) = _$_ChatGPTResponse;

  factory _ChatGPTResponse.fromJson(Map<String, dynamic> json) =
      _$_ChatGPTResponse.fromJson;

  @override
  String get id;
  @override
  String get object;
  @override
  int get created;
  @override
  String get model;
  @override
  Usage get usage;
  @override
  List<Choice> get choices;
  @override
  @JsonKey(ignore: true)
  _$$_ChatGPTResponseCopyWith<_$_ChatGPTResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Usage _$UsageFromJson(Map<String, dynamic> json) {
  return _Usage.fromJson(json);
}

/// @nodoc
mixin _$Usage {
  @JsonKey(name: 'prompt_tokens')
  int get promptTokens => throw _privateConstructorUsedError;
  @JsonKey(name: 'completion_tokens')
  int get completionTokens => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_tokens')
  int get totalTokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsageCopyWith<Usage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageCopyWith<$Res> {
  factory $UsageCopyWith(Usage value, $Res Function(Usage) then) =
      _$UsageCopyWithImpl<$Res, Usage>;
  @useResult
  $Res call(
      {@JsonKey(name: 'prompt_tokens') int promptTokens,
      @JsonKey(name: 'completion_tokens') int completionTokens,
      @JsonKey(name: 'total_tokens') int totalTokens});
}

/// @nodoc
class _$UsageCopyWithImpl<$Res, $Val extends Usage>
    implements $UsageCopyWith<$Res> {
  _$UsageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promptTokens = null,
    Object? completionTokens = null,
    Object? totalTokens = null,
  }) {
    return _then(_value.copyWith(
      promptTokens: null == promptTokens
          ? _value.promptTokens
          : promptTokens // ignore: cast_nullable_to_non_nullable
              as int,
      completionTokens: null == completionTokens
          ? _value.completionTokens
          : completionTokens // ignore: cast_nullable_to_non_nullable
              as int,
      totalTokens: null == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UsageCopyWith<$Res> implements $UsageCopyWith<$Res> {
  factory _$$_UsageCopyWith(_$_Usage value, $Res Function(_$_Usage) then) =
      __$$_UsageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'prompt_tokens') int promptTokens,
      @JsonKey(name: 'completion_tokens') int completionTokens,
      @JsonKey(name: 'total_tokens') int totalTokens});
}

/// @nodoc
class __$$_UsageCopyWithImpl<$Res> extends _$UsageCopyWithImpl<$Res, _$_Usage>
    implements _$$_UsageCopyWith<$Res> {
  __$$_UsageCopyWithImpl(_$_Usage _value, $Res Function(_$_Usage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promptTokens = null,
    Object? completionTokens = null,
    Object? totalTokens = null,
  }) {
    return _then(_$_Usage(
      promptTokens: null == promptTokens
          ? _value.promptTokens
          : promptTokens // ignore: cast_nullable_to_non_nullable
              as int,
      completionTokens: null == completionTokens
          ? _value.completionTokens
          : completionTokens // ignore: cast_nullable_to_non_nullable
              as int,
      totalTokens: null == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Usage implements _Usage {
  const _$_Usage(
      {@JsonKey(name: 'prompt_tokens') required this.promptTokens,
      @JsonKey(name: 'completion_tokens') required this.completionTokens,
      @JsonKey(name: 'total_tokens') required this.totalTokens});

  factory _$_Usage.fromJson(Map<String, dynamic> json) =>
      _$$_UsageFromJson(json);

  @override
  @JsonKey(name: 'prompt_tokens')
  final int promptTokens;
  @override
  @JsonKey(name: 'completion_tokens')
  final int completionTokens;
  @override
  @JsonKey(name: 'total_tokens')
  final int totalTokens;

  @override
  String toString() {
    return 'Usage(promptTokens: $promptTokens, completionTokens: $completionTokens, totalTokens: $totalTokens)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Usage &&
            (identical(other.promptTokens, promptTokens) ||
                other.promptTokens == promptTokens) &&
            (identical(other.completionTokens, completionTokens) ||
                other.completionTokens == completionTokens) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, promptTokens, completionTokens, totalTokens);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsageCopyWith<_$_Usage> get copyWith =>
      __$$_UsageCopyWithImpl<_$_Usage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UsageToJson(
      this,
    );
  }
}

abstract class _Usage implements Usage {
  const factory _Usage(
      {@JsonKey(name: 'prompt_tokens')
          required final int promptTokens,
      @JsonKey(name: 'completion_tokens')
          required final int completionTokens,
      @JsonKey(name: 'total_tokens')
          required final int totalTokens}) = _$_Usage;

  factory _Usage.fromJson(Map<String, dynamic> json) = _$_Usage.fromJson;

  @override
  @JsonKey(name: 'prompt_tokens')
  int get promptTokens;
  @override
  @JsonKey(name: 'completion_tokens')
  int get completionTokens;
  @override
  @JsonKey(name: 'total_tokens')
  int get totalTokens;
  @override
  @JsonKey(ignore: true)
  _$$_UsageCopyWith<_$_Usage> get copyWith =>
      throw _privateConstructorUsedError;
}

Choice _$ChoiceFromJson(Map<String, dynamic> json) {
  return _Choice.fromJson(json);
}

/// @nodoc
mixin _$Choice {
  Message get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChoiceCopyWith<Choice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChoiceCopyWith<$Res> {
  factory $ChoiceCopyWith(Choice value, $Res Function(Choice) then) =
      _$ChoiceCopyWithImpl<$Res, Choice>;
  @useResult
  $Res call({Message message});

  $MessageCopyWith<$Res> get message;
}

/// @nodoc
class _$ChoiceCopyWithImpl<$Res, $Val extends Choice>
    implements $ChoiceCopyWith<$Res> {
  _$ChoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageCopyWith<$Res> get message {
    return $MessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChoiceCopyWith<$Res> implements $ChoiceCopyWith<$Res> {
  factory _$$_ChoiceCopyWith(_$_Choice value, $Res Function(_$_Choice) then) =
      __$$_ChoiceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Message message});

  @override
  $MessageCopyWith<$Res> get message;
}

/// @nodoc
class __$$_ChoiceCopyWithImpl<$Res>
    extends _$ChoiceCopyWithImpl<$Res, _$_Choice>
    implements _$$_ChoiceCopyWith<$Res> {
  __$$_ChoiceCopyWithImpl(_$_Choice _value, $Res Function(_$_Choice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_Choice(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Choice implements _Choice {
  const _$_Choice({required this.message});

  factory _$_Choice.fromJson(Map<String, dynamic> json) =>
      _$$_ChoiceFromJson(json);

  @override
  final Message message;

  @override
  String toString() {
    return 'Choice(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Choice &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChoiceCopyWith<_$_Choice> get copyWith =>
      __$$_ChoiceCopyWithImpl<_$_Choice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChoiceToJson(
      this,
    );
  }
}

abstract class _Choice implements Choice {
  const factory _Choice({required final Message message}) = _$_Choice;

  factory _Choice.fromJson(Map<String, dynamic> json) = _$_Choice.fromJson;

  @override
  Message get message;
  @override
  @JsonKey(ignore: true)
  _$$_ChoiceCopyWith<_$_Choice> get copyWith =>
      throw _privateConstructorUsedError;
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  String get role => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call({String role, String content});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$_MessageCopyWith(
          _$_Message value, $Res Function(_$_Message) then) =
      __$$_MessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String role, String content});
}

/// @nodoc
class __$$_MessageCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$_Message>
    implements _$$_MessageCopyWith<$Res> {
  __$$_MessageCopyWithImpl(_$_Message _value, $Res Function(_$_Message) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
  }) {
    return _then(_$_Message(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Message implements _Message {
  const _$_Message({required this.role, required this.content});

  factory _$_Message.fromJson(Map<String, dynamic> json) =>
      _$$_MessageFromJson(json);

  @override
  final String role;
  @override
  final String content;

  @override
  String toString() {
    return 'Message(role: $role, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Message &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, role, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      __$$_MessageCopyWithImpl<_$_Message>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {required final String role, required final String content}) = _$_Message;

  factory _Message.fromJson(Map<String, dynamic> json) = _$_Message.fromJson;

  @override
  String get role;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      throw _privateConstructorUsedError;
}
