import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/pages/signup/signup_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@riverpod
class SignupNotifier extends StateNotifier<SignupState> {
  SignupNotifier()
      : super(SignupState(
          userNameController: TextEditingController(),
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
          confirmPasswordController: TextEditingController(),
          signupFormKey: GlobalKey<FormState>(),
        ));

  @override
  void dispose() {
    state.userNameController.dispose();
    state.emailController.dispose();
    state.passwordController.dispose();
    state.confirmPasswordController.dispose();
    super.dispose();
  }
}

final signupNotifierProvider =
    StateNotifierProvider<SignupNotifier, SignupState>((ref) {
  return SignupNotifier();
});
