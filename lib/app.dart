import 'package:flutter/material.dart';
import 'package:svik2/presentation/pages/homepage_view.dart';
import 'package:svik2/presentation/pages/login_view.dart';
import 'package:svik2/presentation/pages/signup_view.dart';



class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}
