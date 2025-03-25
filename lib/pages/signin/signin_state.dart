import 'package:flutter/material.dart';

class SigninState {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> signinKey;
  SigninState({
    required this.emailController,
    required this.passwordController,
    required this.signinKey,
  });
}
