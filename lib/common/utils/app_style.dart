import 'package:flutter/material.dart';
import 'package:learning_app/common/utils/app_colors.dart';

class AppTheme {
  static ThemeData appThemeData = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: AppColors.primaryText,
          )));
}
