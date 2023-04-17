import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xff1DA1F2),
      scaffoldBackgroundColor: Colors.grey[100],
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.grey[100],
        iconTheme: IconThemeData(color: Color.fromARGB(255, 8, 8, 8)),
        titleTextStyle: TextStyle(
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
        selectedItemColor: Color(0xff1DA1F2),
        unselectedItemColor: Colors.grey[400],
        elevation: 0,
        selectedIconTheme: IconThemeData(
          size: 30,
        ),
        unselectedIconTheme: IconThemeData(
          size: 25,
        ),
        selectedLabelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
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
          borderSide: BorderSide(
            color: Color(0xff1DA1F2),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Color(0xff1DA1F2),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Color(0xff1DA1F2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: Size(150.0, 50.0),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xff1DA1F2),
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
    Color textColor = Color(0xff1DA1F2).computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
    Color bgColor = Colors.black;
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: bgColor,
      primaryColor: const Color(0xff1DA1F2),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: bgColor,
          selectedItemColor: Color(0xff1DA1F2),
          unselectedItemColor: Colors.grey[500],
          selectedIconTheme: IconThemeData(
            size: 30,
          ),
          unselectedIconTheme: IconThemeData(
            size: 25,
          ),
          selectedLabelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
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
          borderSide: BorderSide(color: Color(0xff1DA1F2), width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 97, 97, 97), width: 1.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 97, 97, 97), width: 1.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        labelStyle: TextStyle(color: Colors.grey[400]),
        hintStyle: TextStyle(color: Colors.grey[400]),
        errorStyle: TextStyle(color: Colors.redAccent),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Color(0xff1DA1F2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: Size(150.0, 50.0),
        ),
      ),
      cardTheme: CardTheme(
        color: Colors.grey[800],
        elevation: 5,
        shadowColor: bgColor,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.grey[200],
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          color: Colors.grey[200],
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyText1: TextStyle(
          color: Colors.grey[200],
          fontSize: 16,
        ),
        button: TextStyle(
          color: Colors.grey[200],
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
