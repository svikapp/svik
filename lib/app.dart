import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svik2/presentation/cubit/bottomnav/bottomnav_cubit.dart';
import 'package:svik2/presentation/cubit/theme/theme_cubit.dart';
import 'package:svik2/presentation/pages/homepage_view.dart';
import 'package:svik2/presentation/pages/login_view.dart';
import 'package:svik2/presentation/pages/signup_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
                  theme: theme,
                  home: HomePage(),
                );
        },
      ),
    );
  }
}
