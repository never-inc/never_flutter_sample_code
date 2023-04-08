import 'package:flutter/material.dart';

enum NavType {
  talkToChatGpt('ChatGPTとチャット'),
  ;

  const NavType(this.title);
  final String title;

  void show(BuildContext context) {
    switch (this) {
      case NavType.talkToChatGpt:
        // TODO(shohei): ページ遷移
        break;
    }
  }
}
