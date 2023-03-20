import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      primaryColor: Colors.blue,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        headline2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontSize: 16.0),
        bodyText2: TextStyle(fontSize: 14.0),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      // primaryColor: Colors.blue,
      brightness: Brightness.dark,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        headline2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontSize: 16.0),
        bodyText2: TextStyle(fontSize: 14.0),
      ),
    );
  }
}
