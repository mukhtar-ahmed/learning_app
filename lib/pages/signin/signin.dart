import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/utils/app_colors.dart';
import 'package:learning_app/common/widgets/app_appbar.dart';
import 'package:learning_app/common/widgets/button.dart';
import 'package:learning_app/common/widgets/text_widget.dart';
import 'package:learning_app/pages/signin/signin_page.dart';
import 'package:learning_app/pages/signin/widgets/signin_widgets.dart';
import 'package:learning_app/pages/signup/signup.dart';

class Signin extends StatelessWidget {
  static const String id = '/signin';
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Signin'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            thirdPartLogin(),
            SizedBox(height: 30.h),
            Center(child: text14Normal(text: 'Or use your email to login')),
            // CustomTextField(hintText: 'Email', icon: Icons.email),
            // CustomTextField(hintText: 'Password', icon: Icons.lock),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: text14Normal(
                  text: 'Forgot Password?',
                  textColor: AppColors.primaryText,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h),
              child: Center(
                child: Button(
                  text: 'Log In',
                  backgroundColor: AppColors.primaryElement,
                  textColor: AppColors.primaryElementText,
                  onTap: () {
                    Navigator.pushNamed(context, SigninPage.id);
                  },
                ),
              ),
            ),
            Center(
              child: Button(
                text: 'Signup',
                backgroundColor: AppColors.primaryElementText,
                textColor: AppColors.primaryText,
                onTap: () {
                  Navigator.pushNamed(context, Signup.id);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
