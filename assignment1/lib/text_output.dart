import 'package:flutter/material.dart';

class TextOutput extends StatelessWidget {
  final List<String> text;
  final int currentIndex;
  TextOutput({required this.text, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text[currentIndex]),
    );
  }
}
