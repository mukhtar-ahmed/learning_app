import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/common/global_loader/app_loader.dart';
import 'package:learning_app/common/utils/app_colors.dart';
import 'package:learning_app/common/widgets/popup_message.dart';
import 'package:learning_app/pages/signin/provider/signin_notifier.dart';
import 'package:learning_app/pages/signin/user.dart';

class SigninController {
  final WidgetRef ref;
  SigninController({
    required this.ref,
  });

  Future<void> handleSignin() async {
    final signin = ref.watch(signinNotifierProvider);

    if (signin.signinKey.currentState!.validate()) {
      final loaderNotifier = ref.read(appLoaderProvider.notifier);
      loaderNotifier.updateLoader(true);
      try {
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: signin.emailController.text.trim(),
                password: signin.passwordController.text.trim());

        if (user.user == null) {
          flutterToast(
              msg: "User not found",
              backgroundColor: AppColors.errorColor,
              textColor: AppColors.primaryElementText);
        }
        // if (user.user!.emailVerified) {
        //   flutterToast(
        //       msg: "Kindly verify your email",
        //       backgroundColor: AppColors.errorColor,
        //       textColor: AppColors.primaryElementText);
        // }
        if (user.user != null) {
          var currentUser = user.user;
          LoginRequestEntity loginRequestEntity = LoginRequestEntity();
          loginRequestEntity.openId = currentUser!.uid;
          loginRequestEntity.email = currentUser.email;
          loginRequestEntity.name = currentUser.displayName;
          loginRequestEntity.avatar = currentUser.photoURL;
          loginRequestEntity.type = 1;
          asyncPostAllData(loginRequestEntity);
          flutterToast(
              msg: "Login Sucess",
              backgroundColor: AppColors.primaryElementStatus,
              textColor: AppColors.primaryElementText);
        }
      } on FirebaseAuthException catch (e) {
        flutterToast(
            msg: e.code,
            backgroundColor: AppColors.errorColor,
            textColor: AppColors.primaryElementText);
      } catch (e) {
        flutterToast(
            msg: e.toString(),
            backgroundColor: AppColors.errorColor,
            textColor: AppColors.primaryElementText);
      } finally {
        loaderNotifier.updateLoader(false);
      }
    } else {
      return;
    }
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {}
}
