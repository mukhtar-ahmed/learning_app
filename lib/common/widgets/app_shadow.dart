import 'package:flutter/material.dart';

BoxShadow appBoxShadow() {
  return BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      spreadRadius: 2,
      blurRadius: 5,
      offset: Offset(0, 5));
}
