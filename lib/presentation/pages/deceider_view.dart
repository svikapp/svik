import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svik/presentation/pages/homepage_view.dart';
import 'package:svik/presentation/pages/authentication/login_view.dart';

import '../bloc/auth/auth_bloc.dart';

class DeceiderView extends StatelessWidget {
  const DeceiderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if(state is AuthLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if(state is Authenticated){
          return HomePage();
        }
        else{
          return LoginView();
        }

      },
    );
  }
}
