import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/utils/app_colors.dart';

Padding customTextField(
    {required String hintText,
    required IconData icon,
    required TextEditingController controller,
    String? Function(String?)? validator}) {
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
          borderSide: const BorderSide(color: AppColors.primaryElement),
        ),
        filled: true,
        fillColor: Colors.grey[100],
      ),
      validator: validator,
    ),
  );
}
