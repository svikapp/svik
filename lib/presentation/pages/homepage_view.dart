import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scaffold(
        appBar: AppBar(
          title: Text("Bottom Navigation Bar"),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(EvaIcons.home),
            label: '',
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(EvaIcons.messageCircle),
              label: ''),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(EvaIcons.search),
              label: ''),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(EvaIcons.bell),
              label: ''),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(EvaIcons.person),
              label: ''),
        ],
      ),
    );
  }
}
