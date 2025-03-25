import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/common/global_loader/app_loader.dart';
import 'package:learning_app/common/widgets/popup_message.dart';
import 'package:learning_app/pages/signup/provider/signup_notifier.dart';

class SignupController {
  final WidgetRef ref;

  SignupController({required this.ref});

  Future<void> handleSignup() async {
    final state = ref.watch(signupNotifierProvider);
    final loaderNotifier = ref.read(appLoaderProvider.notifier);

    if (!state.signupFormKey.currentState!.validate()) {
      flutterToast(
        msg: 'Please fill all fields correctly',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }

    loaderNotifier.updateLoader(true);

    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: state.emailController.text.trim(),
        password: state.passwordController.text,
      );

      final User? user = userCredential.user;
      if (user == null) {
        throw FirebaseAuthException(
          code: 'null-user',
          message: 'Failed to create user account.',
        );
      }
      await user.sendEmailVerification();

      await user.updateDisplayName(state.userNameController.text.trim());

      // Only navigate if the context is still valid
      if (ref.context.mounted) {
        Navigator.pop(ref.context);
      }

      flutterToast(
        msg: 'An Email Sent to your email address, Kindly verified',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = _getFirebaseErrorMessage(e.code);
      flutterToast(
        msg: errorMessage,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } catch (e) {
      flutterToast(
        msg: 'An unexpected error occurred. Please try again.',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } finally {
      loaderNotifier.updateLoader(false);
    }
  }

  String _getFirebaseErrorMessage(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'This email is already registered. Please use a different email.';
      case 'invalid-email':
        return 'Please enter a valid email address.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled. Please contact support.';
      case 'weak-password':
        return 'Please enter a stronger password.';
      case 'null-user':
        return 'Failed to create user account. Please try again.';
      default:
        return 'An error occurred during signup. Please try again.';
    }
  }
}
