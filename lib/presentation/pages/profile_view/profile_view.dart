<<<<<<< HEAD
=======
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svik2/presentation/cubit/theme/theme_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile View"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: GestureDetector(
        onTap: () {
          context.read<ThemeCubit>().toggleTheme();
        },
        child: Container(
          width: 200,
          height: 200,
          color: Color.fromARGB(255, 167, 23, 23),
          padding: EdgeInsets.all(5),
          child: Text("svik"),
          margin: EdgeInsets.all(10),
        ),
      ),
    );
  }
}
>>>>>>> 5842fc144234c300a410c75532e4dfa3f9beaef5
