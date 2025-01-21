import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/common/widgets/popup_message.dart';
import 'package:learning_app/pages/signup/provider/signup_notifier.dart';

class SignupController {
  final WidgetRef ref;

  SignupController({required this.ref});

  handleSignup() {
    final state = ref.watch(signupNotifierProvider);
    print("::::::::::::::::::::");
    print(state.signupFormKey);
    print("::::::::::::::::::::");
    if (state.signupFormKey.currentState!.validate()) {
      flutterToast(
          msg: 'abc', backgroundColor: Colors.red, textColor: Colors.black);
    } else {
      flutterToast(
          msg: 'ab1c', backgroundColor: Colors.red, textColor: Colors.black);
    }
  }
}
