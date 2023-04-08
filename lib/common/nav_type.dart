import 'package:flutter/material.dart';

enum NavType {
  talkToChatGpt('ChatGPTとチャット'),
  ;

  const NavType(this.title);
  final String title;

  void show(BuildContext context) {
    // TODO(shohei): ページ遷移
  }
}
