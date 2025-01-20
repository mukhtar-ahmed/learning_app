import 'package:flutter/material.dart';
import 'package:learning_app/common/utils/app_colors.dart';

Widget text24Normal(
    {required String text, Color textColor = AppColors.primaryText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 24,
      color: textColor,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget text16Normal(
    {required String text,
    Color textColor = AppColors.primarySecondaryElementText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 16,
      color: textColor,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget text14Normal(
    {required String text,
    Color textColor = AppColors.primaryThreeElementText}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: TextStyle(
      fontSize: 14,
      color: textColor,
      fontWeight: FontWeight.normal,
    ),
  );
}
