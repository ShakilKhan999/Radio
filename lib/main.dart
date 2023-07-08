import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relaks_media/screens/bottomnevigation.dart';
import 'package:relaks_media/screens/forgot_password_screen.dart';
import 'package:relaks_media/screens/login_screen.dart';
import 'package:relaks_media/screens/otp_screen.dart';
import 'package:relaks_media/screens/reset_password_screen.dart';
import 'package:relaks_media/screens/signup_screen.dart';
import 'package:relaks_media/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392, 860),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(),
          home:  BottomNavigation(),
        );
      },
    );
  }
}
