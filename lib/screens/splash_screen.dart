import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relaks_media/screens/bottomnevigation.dart';
import 'package:relaks_media/screens/login_screen.dart';
import 'package:relaks_media/screens/signup_screen.dart';

import '../utils/glass_box.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName='/splash';


  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/splash.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.black.withOpacity(0.8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.sp),
                        child: GlassBox(
                          child: Container(
                            color: Colors.black.withOpacity(0.6),
                              height: 150.h,

                              child: Padding(
                                padding:  EdgeInsets.all(24.0.sp),
                                child: Image.asset('images/logo.png',),
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width-60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Poppins',
                            fontSize: 13.sp,

                          ),
                        ),

                        TextButton(
                          onPressed:(){
                            Navigator.pushNamed(context,SignupScreen.routeName);
                          },
                          child: Text(
                            "Create an account",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 15.sp,

                              decoration: TextDecoration.combine([
                                TextDecoration.underline,
                              ]),
                              decorationColor: Colors.grey,
                              decorationThickness: 3.0.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    height: 50.h,
                    width: 220.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.grey.shade700,
                          // Adjust the gray shade as desired
                          Colors.black,
                        ],

                        stops: [0.4, 1.0],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 55.0.sp, vertical: 6.0.sp),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 18.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0.h),
                  Container(
                    height: 50.h,
                    width: 220.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    child: ElevatedButton(

                      onPressed: () {
                        Navigator.pushNamed(context, BottomNavigation.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 55.0.sp, vertical: 8.0.sp),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.grey,
                            fontSize: 16.0.sp,

                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
