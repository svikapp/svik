import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
          ListTile(
          leading: Icon(Icons.account_box_rounded),
          title: Text("Account"),
          onTap: () {
            
          },
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text("About"),
          onTap: () {
            
          },
        ),
        ListTile(
          leading: Icon(Icons.help),
          title: Text("Help"),
          onTap: () {
            
          },
        ),
        ListTile(
          leading: Icon(Icons.money),
          title: Text("Donate"),
          onTap: () {
            
          },
        ),

      ],
    );
  }
}