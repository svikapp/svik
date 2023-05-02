import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svik/presentation/bloc/signup/signup_bloc.dart';

class SignupPage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        title: Text("Signup"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Text(
                    'Create Account',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Connect with your friends",
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
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: BlocConsumer<SignupBloc, SignupState>(
                listener: (context, state) {
                  //TODO: Implement snackbar
                  if(state is SignupSuccess){
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    child: state is SignupLoading
                        ? const SizedBox(
                            height: 20.0,
                            width: 20.0,
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                              backgroundColor: Colors.transparent,
                              strokeWidth: 4.0,
                            ),
                          )
                        : const Text('Signup'),
                    onPressed: () {
                      BlocProvider.of<SignupBloc>(context).add(
                        SignupButtonPressed(
                          nameController.text,
                          emailController.text,
                          passwordController.text,
                        ),
                      );
                      // Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 17),
                  ),
                  onPressed: () {
                    //signup screen
                    Navigator.pushNamed(context, '/login');
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
