import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svik2/presentation/cubit/bottomnav/bottomnav_cubit.dart';
import 'package:svik2/presentation/cubit/theme/theme_cubit.dart';
import 'package:svik2/presentation/pages/homepage_view.dart';
import 'package:svik2/presentation/pages/login_view.dart';
import 'package:svik2/presentation/pages/profile_view/profile_view.dart';
import 'package:svik2/presentation/pages/settings/setting_view.dart';
import 'package:svik2/presentation/pages/settings/views/about_view/about_view.dart';
import 'package:svik2/presentation/pages/settings/views/set_theme_view/set_theme_view.dart';
import 'package:svik2/presentation/pages/signup_view.dart';
import 'package:svik2/presentation/themes/app_theme.dart';

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
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            initialRoute: '/',
            routes: {
              "/setting": (context) => SettingsView(),
              "/settings/theme": (context) => SetThemeView(),
              "/settings/about": (context) => AboutView()
            },
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            home: SignupPage(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
