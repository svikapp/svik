import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xff1DA1F2),
      scaffoldBackgroundColor: Colors.grey[100],
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.grey[100],
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 8, 8, 8)),
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 8, 8, 8),
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey[100],
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xff1DA1F2),
        unselectedItemColor: Colors.grey[400],
        elevation: 0,
        selectedIconTheme: const IconThemeData(
          size: 30,
        ),
        unselectedIconTheme: const IconThemeData(
          size: 25,
        ),
        selectedLabelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
        ),
        showUnselectedLabels: false,
        showSelectedLabels: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            color: Color(0xff1DA1F2),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            color: Color(0xff1DA1F2),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff1DA1F2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: const Size(150.0, 50.0),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: const Color(0xff1DA1F2),
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        minWidth: 150.0,
        height: 50.0,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) => Colors.blue),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateColor.resolveWith((states) => Colors.blue),
        // trackColor:
        //     MaterialStateColor.resolveWith((states) => Colors.grey[400]),
      ),
    );
  }

  //hello
  static ThemeData get dark {
    Color textColor = const Color(0xff1DA1F2).computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
    Color bgColor = Colors.black;
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: bgColor,
      primaryColor: const Color(0xff1DA1F2),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: bgColor,
          selectedItemColor: const Color(0xff1DA1F2),
          unselectedItemColor: Colors.grey[500],
          selectedIconTheme: const IconThemeData(
            size: 30,
          ),
          unselectedIconTheme: const IconThemeData(
            size: 25,
          ),
          selectedLabelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
          ),
          showUnselectedLabels: false,
          showSelectedLabels: false),
      appBarTheme: AppBarTheme(
        color: bgColor,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
        titleTextStyle: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        // titleTextStyle: TextStyle(
        //   headline6: TextStyle(
        //     color: Colors.grey[200],
        //     fontSize: 20,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: bgColor,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[900],
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff1DA1F2), width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 97, 97, 97), width: 1.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 97, 97, 97), width: 1.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        labelStyle: TextStyle(color: Colors.grey[400]),
        hintStyle: TextStyle(color: Colors.grey[400]),
        errorStyle: const TextStyle(color: Colors.redAccent),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff1DA1F2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: const Size(150.0, 50.0),
        ),
      ),
      cardTheme: CardTheme(
        color: Colors.grey[800],
        elevation: 5,
        shadowColor: bgColor,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: Colors.grey[200],
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: Colors.grey[200],
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: Colors.grey[200],
          fontSize: 16,
        ),
        labelLarge: TextStyle(
          color: Colors.grey[200],
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
