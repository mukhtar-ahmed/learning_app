import 'package:flutter/material.dart';
import 'package:learning_app/common/utils/app_colors.dart';
import 'package:learning_app/common/widgets/button.dart';
import 'package:learning_app/common/widgets/text_widget.dart';
import 'package:learning_app/pages/signin/signin.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.index,
    required this.controller,
  });
  final String imagePath;
  final String title;
  final String subTitle;
  final int index;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imagePath),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: text24Normal(text: title),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: text16Normal(text: subTitle),
        ),
        const SizedBox(
          height: 20,
        ),
        Button(
            textColor: AppColors.primaryElementText,
            backgroundColor: AppColors.primaryElement,
            text: index > 2 ? 'Get Started' : 'Next',
            onTap: () {
              if (index < 3) {
                controller.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear);
              } else {
                Navigator.pushNamed(context, Signin.id);
              }
            })
      ],
    );
  }
}
