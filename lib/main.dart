import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/utils/app_style.dart';
import 'package:learning_app/pages/signin/signin.dart';
import 'package:learning_app/pages/welcome/welcome.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive UI scaling
    return ScreenUtilInit(
      designSize:
          const Size(360, 690), // Set the design size (width x height) in dp
      minTextAdapt: true, // Ensure text scales dynamically to fit screen size
      splitScreenMode: true, // Enable split screen mode support
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false, // Disable debug banner
          title: 'Learning App',
          theme: AppTheme.appThemeData,
          // Define initial route for navigation
          initialRoute: Welcome.id,
          routes: {
            Welcome.id: (context) => Welcome(),
            Signin.id: (context) => Signin(),
          },
        );
      },
    );
  }
}
