import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/utils/app_colors.dart';
import 'package:learning_app/common/widgets/app_appbar.dart';
import 'package:learning_app/common/widgets/button.dart';
import 'package:learning_app/common/widgets/text_widget.dart';
import 'package:learning_app/pages/signin/widgets/signin_widgets.dart';
import 'package:learning_app/pages/signup/provider/signup_notifier.dart';

class Signup extends ConsumerWidget {
  static const String id = '/signup';
  const Signup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerState = ref.watch(signupNotifierProvider);
    return Scaffold(
      appBar: buildAppBar(title: 'Signup'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                  child: text14Normal(
                      text: 'Enter your details below and free signup')),
              SizedBox(
                height: 50.h,
              ),
              CustomTextField(
                  hintText: 'Username',
                  icon: Icons.person,
                  controller: registerState.userNameController),
              CustomTextField(
                  hintText: 'Email',
                  icon: Icons.email,
                  controller: registerState.emailController),
              CustomTextField(
                  hintText: 'Password',
                  icon: Icons.lock,
                  controller: registerState.passwordController),
              CustomTextField(
                  hintText: 'Confirm Password',
                  icon: Icons.lock,
                  controller: registerState.confirmPasswordController),
              text14Normal(
                  text:
                      'By creating your account you have to agree with our tern & conditions'),
              SizedBox(
                height: 100.h,
              ),
              Center(
                child: Button(
                  text: 'Signup',
                  backgroundColor: AppColors.primaryElement,
                  textColor: AppColors.primaryElementText,
                  onTap: () {
                    registerState.signupFormKey.currentState!.save();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
