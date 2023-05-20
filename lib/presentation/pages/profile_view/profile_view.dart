import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => Navigator.pushNamed(context, '/setting'), icon: const Icon(Icons.settings))
        ],
        title: const Text("Profile"),
        
      ),
      
    );
  }
}

