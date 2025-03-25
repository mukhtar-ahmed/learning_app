import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/global_loader/app_loader.dart';
import 'package:learning_app/common/utils/app_colors.dart';
import 'package:learning_app/common/widgets/app_appbar.dart';
import 'package:learning_app/common/widgets/button.dart';
import 'package:learning_app/common/widgets/custom_textfield.dart';
import 'package:learning_app/common/widgets/text_widget.dart';
import 'package:learning_app/pages/signin/provider/signin_notifier.dart';
import 'package:learning_app/pages/signin/signin_controller.dart';

class SigninPage extends ConsumerStatefulWidget {
  static const String id = '/signin_page';
  const SigninPage({super.key});

  @override
  ConsumerState<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends ConsumerState<SigninPage> {
  late SigninController _signinController;

  @override
  void initState() {
    _signinController = SigninController(ref: ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final signin = ref.watch(signinNotifierProvider);
    final appLoader = ref.watch(appLoaderProvider);
    return Scaffold(
      appBar: buildAppBar(title: 'Signin'),
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
                  key: signin.signinKey,
                  child: Column(
                    children: [
                      customTextField(
                        hintText: 'Email',
                        icon: Icons.email,
                        controller: signin.emailController,
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
                        controller: signin.passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
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
                                text: 'Signin',
                                backgroundColor: AppColors.primaryElement,
                                textColor: AppColors.primaryElementText,
                                onTap: () {
                                  _signinController.handleSignin();
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
