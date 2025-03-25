import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/pages/signin/signin_state.dart';

class SigninNotifier extends StateNotifier<SigninState> {
  SigninNotifier()
      : super(
          SigninState(
            emailController: TextEditingController(),
            passwordController: TextEditingController(),
            signinKey: GlobalKey<FormState>(),
          ),
        );
}

final signinNotifierProvider =
    StateNotifierProvider<SigninNotifier, SigninState>((ref) {
  return SigninNotifier();
});
