import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svik2/injection_container.dart';
import 'package:svik2/presentation/bloc/auth/auth_bloc.dart';
import 'package:svik2/presentation/cubit/bottomnav/bottomnav_cubit.dart';
import 'package:svik2/presentation/cubit/theme/theme_cubit.dart';
import 'package:svik2/presentation/pages/settings/setting_view.dart';
import 'package:svik2/presentation/pages/settings/views/about_view/about_view.dart';
import 'package:svik2/presentation/pages/settings/views/set_theme_view/set_theme_view.dart';
import 'package:svik2/presentation/pages/deceider_view.dart';
import 'package:svik2/presentation/themes/app_theme.dart';

import 'domain/usecases/auth/verify_session.dart';

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
        ),
        BlocProvider(
          create: (context) => AuthBloc(
            verifySession: gt<VerifySession>(),
          )..add(AppStarted()),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            initialRoute: '/',
            routes: {
              "/":(context) => const DeceiderView(),
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
