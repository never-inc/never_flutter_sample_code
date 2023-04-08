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

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static List<NavType> get _navList => [
        NavType.talkToChatGpt,
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
