import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile View"),),
      body: Container(
        width: 200,
        height:200,
        color: Color.fromARGB(255, 167, 23, 23),
        padding:EdgeInsets.all(5),
        child: Text("svik"),
        margin: EdgeInsets.all(10),
        
      ),
    );
  }
}