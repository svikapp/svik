import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.developer_mode),
            title: Text("Software Licenses"),
            onTap: () => showLicensePage(context: context),
          )
        ],
      ),
    );
  }
}
