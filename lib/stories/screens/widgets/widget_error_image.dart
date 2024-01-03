import 'package:flutter/material.dart';

class WidgetErrorImage extends StatelessWidget {
  const WidgetErrorImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.image,
          color: Theme.of(context).colorScheme.onPrimary,
          size: 50,
        ),
        const SizedBox(height: 20),
        Text(
          'No image...',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ],
    );
  }
}
