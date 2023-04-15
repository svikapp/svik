import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svik/presentation/cubit/theme/theme_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => Navigator.pushNamed(context, '/setting'), icon: Icon(Icons.settings))
        ],
        title: Text("Profile"),
        
      ),
      
    );
  }
}

