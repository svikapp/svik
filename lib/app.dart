import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svik/injection_container.dart';
import 'package:svik/presentation/bloc/auth/auth_bloc.dart';
import 'package:svik/presentation/cubit/bottomnav/bottomnav_cubit.dart';
import 'package:svik/presentation/cubit/theme/theme_cubit.dart';
import 'package:svik/presentation/pages/authentication/login_view.dart';
import 'package:svik/presentation/pages/settings/setting_view.dart';
import 'package:svik/presentation/pages/settings/views/about_view/about_view.dart';
import 'package:svik/presentation/pages/settings/views/set_theme_view/set_theme_view.dart';
import 'package:svik/presentation/pages/decider_view.dart';
import 'package:svik/presentation/themes/app_theme.dart';

import 'domain/usecases/auth/verify_session.dart';
import 'presentation/pages/authentication/signup_view.dart';

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
            verifySession: sl<VerifySession>(),
          )..add(AppStarted()),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            initialRoute: '/',
            routes: {
              "/":(context) => const DeciderView(),
              "/setting": (context) => const SettingsView(),
              "/settings/theme": (context) => const SetThemeView(),
              "/settings/about": (context) => const AboutView(),
              "/login":(context) => LoginView(),
              "/signup":(context) => const SignupPage(),
            },
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            // home: SignupPage(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
