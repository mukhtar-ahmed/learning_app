import 'package:flutter/material.dart';
import 'package:learning_app/common/utils/app_colors.dart';
import 'package:learning_app/common/widgets/app_shadow.dart';
import 'package:learning_app/common/widgets/text_widget.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.index,
    required this.controller,
  });
  final int index;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('hello $index');
        if (index < 3) {
          controller.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.linear);
        }
      },
      child: Container(
        height: 50,
        width: 250,
        child: Center(
            child: text16Normal(
                text: index > 2 ? 'Get Started' : 'Next',
                textColor: AppColors.primaryElementText)),
        decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [appBoxShadow()]),
      ),
    );
  }
}
