import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/global_loader/app_loader.dart';
import 'package:learning_app/common/utils/app_colors.dart';
import 'package:learning_app/common/widgets/app_appbar.dart';
import 'package:learning_app/common/widgets/button.dart';
import 'package:learning_app/common/widgets/custom_textfield.dart';
import 'package:learning_app/common/widgets/text_widget.dart';
import 'package:learning_app/pages/signup/controller/signup_controller.dart';
import 'package:learning_app/pages/signup/provider/signup_notifier.dart';

class Signup extends ConsumerStatefulWidget {
  static const String id = '/signup';
  const Signup({super.key});

  @override
  ConsumerState<Signup> createState() => _SignupState();
}

class _SignupState extends ConsumerState<Signup> {
  late SignupController _signupController;

  @override
  void initState() {
    _signupController = SignupController(ref: ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final registerState = ref.watch(signupNotifierProvider);
    final appLoader = ref.watch(appLoaderProvider);
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
              Form(
                  key: registerState.signupFormKey,
                  child: Column(
                    children: [
                      customTextField(
                        hintText: 'Username',
                        icon: Icons.person,
                        controller: registerState.userNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your user name';
                          }
                          return null;
                        },
                      ),
                      customTextField(
                        hintText: 'Email',
                        icon: Icons.email,
                        controller: registerState.emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      customTextField(
                        hintText: 'Password',
                        icon: Icons.lock,
                        controller: registerState.passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      customTextField(
                        hintText: 'Confirm Password',
                        icon: Icons.lock,
                        controller: registerState.confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please re-enter your password';
                          } else if (value !=
                              registerState.passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      text14Normal(
                          text:
                              'By creating your account you have to agree with our tern & conditions'),
                      SizedBox(
                        height: 100.h,
                      ),
                      appLoader
                          ? Center(
                              child: Button(
                                text: 'Loading',
                                backgroundColor: AppColors.primaryElement,
                                textColor: AppColors.primaryElementText,
                              ),
                            )
                          : Center(
                              child: Button(
                                text: 'Signup',
                                backgroundColor: AppColors.primaryElement,
                                textColor: AppColors.primaryElementText,
                                onTap: () {
                                  _signupController.handleSignup();
                                },
                              ),
                            )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
