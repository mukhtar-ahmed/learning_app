import 'package:flutter/material.dart';

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
