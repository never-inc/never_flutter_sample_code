import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:never_flutter_sample_code/profile/screens/profile_screen.dart';
import 'package:never_flutter_sample_code/talk_to_chat_gpt/screens/chat_screen.dart';

enum NavType {
  talkToChatGpt('ChatGPTとチャット'),
  profile('プロフィール'),
  ;

  const NavType(this.title);
  final String title;

  void show(BuildContext context) {
    switch (this) {
      case NavType.talkToChatGpt:
        Navigator.of(context, rootNavigator: true).push<void>(
          CupertinoPageRoute(
            builder: (_) => const ChatScreen(),
          ),
        );
        break;
      case NavType.profile:
        Navigator.of(context, rootNavigator: true).push<void>(
          CupertinoPageRoute(
            builder: (_) => const ProfileScreen(),
          ),
        );
        break;
    }
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static List<NavType> get _navList => [
        NavType.talkToChatGpt,
        NavType.profile,
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Never Flutter Sample Code'),
      ),
      body: ListView.separated(
        itemCount: _navList.length,
        itemBuilder: (context, index) {
          final nav = _navList[index];
          return InkWell(
            onTap: () {
              nav.show(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                nav.title,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, _) {
          return const Divider(height: 1);
        },
      ),
    );
  }
}
