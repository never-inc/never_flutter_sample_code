import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:never_flutter_sample_code/app.dart';

Future<void> main() async {
  await dotenv.load(); // 環境変数をロード
  runApp(const App());
}
