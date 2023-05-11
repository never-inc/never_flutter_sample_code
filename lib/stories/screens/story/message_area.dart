import 'package:flutter/material.dart';

// メッセージ入力欄のWidget
class MessageArea extends StatefulWidget {
  const MessageArea({
    super.key,
    required this.focusNode,
    required this.textController,
  });

  final FocusNode focusNode;
  final TextEditingController textController;

  @override
  State<MessageArea> createState() => _MessageAreaState();
}

class _MessageAreaState extends State<MessageArea> {
  bool hasText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(
                        8,
                      ),
                      child: TextField(
                        focusNode: widget.focusNode,
                        controller: widget.textController,
                        maxLines: 4,
                        minLines: 1,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          hintText: 'メッセージを送信',
                          hintStyle:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          suffixIcon: widget.focusNode.hasFocus
                              ? hasText
                                  ? TextButton(
                                      onPressed: () {
                                        // バックエンド等にメッセージ送信する
                                        debugPrint(widget.textController.text);
                                      },
                                      child: Text(
                                        '送信',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyLarge?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                      ),
                                    )
                                  : IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.gif_box_outlined,
                                        color: Colors.white,
                                        size: 32,
                                      ),
                                    )
                              : const SizedBox.shrink(),
                        ),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.white, fontSize: 16),
                        onChanged: (value) {
                          setState(() {
                            hasText = value.isNotEmpty;
                          });
                        },
                      ),
                    ),
                  ),
                  widget.focusNode.hasFocus
                      ? const SizedBox.shrink()
                      : Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                              onPressed: () => {},
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                              onPressed: () => {
                                // バックエンド等にメッセージ送信する
                                debugPrint(widget.textController.text),
                              },
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
