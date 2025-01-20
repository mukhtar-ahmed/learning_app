import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/utils/app_colors.dart';
import 'package:learning_app/common/widgets/text_widget.dart';

Widget thirdPartLogin() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      loginButton('assets/icons/google.png'),
      loginButton('assets/icons/apple.png'),
      loginButton('assets/icons/facebook.png')
    ],
  );
}

Widget loginButton(String imagePath) {
  return GestureDetector(
    onTap: () {},
    child: CircleAvatar(
      child: Image.asset(imagePath),
    ),
  );
}

Padding CustomTextField(
    {required String hintText,
    required IconData icon,
    required TextEditingController controller}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.primaryElement),
        ),
        filled: true,
        fillColor: Colors.grey[100],
      ),
    ),
  );
}
