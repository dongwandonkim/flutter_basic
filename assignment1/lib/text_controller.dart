import 'package:assignment1/text_output.dart';
import 'package:flutter/material.dart';

class TextController extends StatelessWidget {
  final List<String> text;
  final int currentIndex;
  final VoidCallback textHandler;

  TextController(this.text, this.currentIndex, this.textHandler);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextOutput(text: text, currentIndex: currentIndex),
        ElevatedButton(
            onPressed: textHandler, child: const Text('Change text')),
      ],
    );
  }
}
