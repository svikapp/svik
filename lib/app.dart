import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svik2/presentation/bloc/navigation_bloc/navigation_bloc.dart';
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
          create: (context) => NavigationBloc()..add(NavigateToFeedView()),
        )
      ],
      child: MaterialApp(
        home: Scaffold(
          body: HomePage(),
        ),
      ),
    );
  }
}
