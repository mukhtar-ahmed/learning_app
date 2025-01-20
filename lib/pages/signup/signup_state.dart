import 'package:flutter/material.dart';

class SignupState {
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> signupFormKey;

  SignupState({
    required this.userNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.signupFormKey,
  });
}
