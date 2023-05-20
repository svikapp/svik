import 'package:flutter/material.dart';
import 'package:svik/presentation/pages/settings/widgets/settings_list.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SettingsList(),
      
    );
  }
}