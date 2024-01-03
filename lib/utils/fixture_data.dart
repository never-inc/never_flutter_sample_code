import 'package:flutter/services.dart';

Future<String> fixture(String name) {
  final file = rootBundle.loadString(name);
  return file;
}
