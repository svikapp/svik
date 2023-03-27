import 'package:flutter/cupertino.dart';
import 'app.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const App());
}
