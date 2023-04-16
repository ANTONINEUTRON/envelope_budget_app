import 'package:flutter/material.dart';

class AuthTextfield extends StatelessWidget{
  AuthTextfield({
    required this.labelHint,
    this.isPassword: false,
    this.onChanged: null,
    this.errorText: null
  });
  final String labelHint;
  final bool isPassword;
  final Function(String)? onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelHint,
        hintText: labelHint,
        errorText: errorText
      ),
      obscureText: isPassword,
      autocorrect: false,
      enableSuggestions: false,
      onChanged: onChanged,
    );
  }

}