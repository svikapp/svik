import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svik/presentation/bloc/auth/auth_bloc.dart';

import '../../bloc/login/login_bloc.dart';

class LoginView extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();

  LoginView({super.key});

  void login(BuildContext context) {
    final isValidated = _loginFormKey.currentState!.validate();
    isValidated
        ? BlocProvider.of<LoginBloc>(context).add(
            LoginButtonPressed(emailController.text, passwordController.text),
          )
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Form(
          key: _loginFormKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        'Hello Again!',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Welcome back you've been missed",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter email";
                      } else if (!value.contains('@')) {
                        return "Enter a valid email";
                      }
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter password";
                      } else if (value.length < 6) {
                        return "Password should have 6 characters";
                      }
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: const Text(
                    'Forgot Password',
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      // if(state is LoginSuccess){
                      //   context.read<AuthBloc>().add(LogInUser());
                      // }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        child: state is LoginLoading
                            ? const SizedBox(
                                height: 20.0,
                                width: 20.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                  backgroundColor: Colors.transparent,
                                  strokeWidth: 4.0,
                                ),
                              )
                            : const Text('Login'),
                        onPressed: () {
                          BlocProvider.of<LoginBloc>(context).add(
                            LoginButtonPressed(
                              emailController.text,
                              passwordController.text,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Does not have account?'),
                    TextButton(
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 17),
                      ),
                      onPressed: () {
                        //signup screen
                        Navigator.pushNamed(context, '/signup');
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
