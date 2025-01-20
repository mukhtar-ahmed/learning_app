import 'package:flutter/material.dart';
import 'package:learning_app/common/utils/app_colors.dart';
import 'package:learning_app/common/widgets/text_widget.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    title: text16Normal(text: title, textColor: AppColors.primaryText),
    centerTitle: true,
    shadowColor: Colors.grey,
  );
}
