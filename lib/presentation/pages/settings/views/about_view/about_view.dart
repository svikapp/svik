import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.developer_mode),
            title: const Text("Software Licenses"),
            onTap: () => showLicensePage(context: context),
          )
        ],
      ),
    );
  }
}
