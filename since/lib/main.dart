import 'package:flutter/material.dart';
import 'package:since/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
        theme: ThemeData(
          fontFamily: 'sunflower',
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Colors.white,
              fontFamily: "parisienne",
              fontSize: 80,
            ),
            headline2: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
            bodyText1: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
            bodyText2: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        home: HomeScreen()),
  );
}
