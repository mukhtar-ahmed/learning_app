import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

flutterToast(
    {required String msg,
    required Color backgroundColor,
    required Color textColor}) {
  Fluttertoast.showToast(
      msg: msg,
      backgroundColor: backgroundColor,
      textColor: textColor,
      gravity: ToastGravity.TOP);
}
