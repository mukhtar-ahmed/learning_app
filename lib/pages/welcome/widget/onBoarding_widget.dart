import 'package:flutter/material.dart';
import 'package:learning_app/common/widgets/button.dart';
import 'package:learning_app/common/widgets/text_widget.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: text24Normal(text: title),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: text16Normal(text: subTitle),
        ),
        SizedBox(
          height: 20,
        ),
        Button(
          index: index,
          controller: controller,
        )
      ],
    );
  }
}
