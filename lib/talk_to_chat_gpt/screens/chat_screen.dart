import 'package:flutter/material.dart';
import 'package:never_flutter_sample_code/talk_to_chat_gpt/sevices/chat_gpt_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();

  final List<String> _messages = [];

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  Future<void> _handleSubmitted(String text) async {
    FocusScope.of(context).unfocus(); // メッセージ送信後にキーボードを閉じる
    _textController.clear();
    setState(() {
      _messages.add('User: $text');
    });

    // ChatGPT関数を使用して応答を取得する
    try {
      final response = await chatGPT(text);
      final chatGptResponse = response.choices[0].text.trim();
      print(chatGptResponse);
      setState(() {
        _messages.add('ChatGPT: $chatGptResponse');
      });
      _scrollToBottom(); // 追加
    } on Exception catch (e) {
      print('Error: $e');
      await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('エラーが発生しました'),
            content: Text('APIからの応答が得られませんでした。詳細：$e'),
            actions: <Widget>[
              TextButton(
                child: const Text('閉じる'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration:
                  const InputDecoration.collapsed(hintText: 'メッセージを入力してください'),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(String message, bool isUserMessage) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment:
            isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: isUserMessage ? Colors.blue : Colors.grey,
              ),
              child: Text(
                message,
                style: TextStyle(
                  color: isUserMessage ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('チャット')),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus(); // 入力フォーム以外をタップした時にキーボードを閉じる
          },
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    final isUserMessage = message.startsWith('User: ');
                    final displayMessage = isUserMessage
                        ? message.replaceFirst('User: ', '')
                        : message.replaceFirst('ChatGPT: ', '');
                    return _buildMessageItem(displayMessage, isUserMessage);
                  },
                ),
              ),
              const Divider(height: 1),
              DecoratedBox(
                decoration: BoxDecoration(color: Theme.of(context).cardColor),
                child: _buildTextComposer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
