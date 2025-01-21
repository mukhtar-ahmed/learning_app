import 'package:flutter/material.dart';
import 'package:learning_app/common/utils/app_colors.dart';
import 'package:learning_app/common/widgets/app_shadow.dart';
import 'package:learning_app/common/widgets/text_widget.dart';
import 'package:learning_app/pages/signin/signin.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.onTap,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });
  final void Function()? onTap;
  final String text;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [appBoxShadow()]),
        child: Center(child: text16Normal(text: text, textColor: textColor)),
      ),
    );
  }
}
