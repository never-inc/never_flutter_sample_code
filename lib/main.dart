import 'package:flutter/material.dart';
import 'package:never_flutter_sample_code/common/nav_type.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Never Flutter Sample Code',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static List<NavType> get _sampleCodeList => [
        NavType.talkToChatGpt,
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Never Flutter Sample Code'),
      ),
      body: ListView.separated(
        itemCount: _sampleCodeList.length,
        itemBuilder: (context, index) {
          final sample = _sampleCodeList[index];
          return InkWell(
            onTap: () {
              sample.show(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                sample.title,
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