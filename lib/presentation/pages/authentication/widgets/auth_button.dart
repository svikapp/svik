import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const AuthButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed,
      child: Text(text),
    );
  }
}
