import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svik/injection_container.dart';
import 'package:svik/presentation/bloc/auth/auth_bloc.dart';
import 'package:svik/presentation/bloc/login/login_bloc.dart';
import 'package:svik/presentation/cubit/bottomnav/bottomnav_cubit.dart';
import 'package:svik/presentation/cubit/theme/theme_cubit.dart';
import 'package:svik/presentation/routes/app_routes.dart';
import 'package:svik/presentation/themes/app_theme.dart';

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
        BlocProvider(create: (context)=>sl<LoginBloc>()),
        BlocProvider(
          create: (context) => AuthBloc(
            verifySession: sl<VerifySession>(),
            loginBloc: BlocProvider.of<LoginBloc>(context),
          )..add(AppStarted()),
        ),
        
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            initialRoute: AppRoutes.home,
            routes: AppRoutes.routes,
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
