import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:relaks_media/screens/reset_password_screen.dart';

import '../utils/glass_box.dart';

class OtpScreen extends StatefulWidget {
  static const String routeName='/otp';


  const OtpScreen({Key? key, }) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

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
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height - 550,
                              width: MediaQuery.of(context).size.width - 80,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    'Enter OTP',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Center(
                                    child: Text(
                                      "An 4 digit code has been sent to\n+8801369587402",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15.sp,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          SizedBox(height: 5.h),
                                          PinCodeTextField(
                                            appContext: context,
                                            length: 4,
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                            ),
                                            pinTheme: PinTheme(
                                              shape: PinCodeFieldShape.box,
                                              borderRadius: BorderRadius.circular(5.sp),
                                              fieldHeight: 45.h,
                                              fieldWidth: 70.w,
                                              inactiveColor: Colors.grey,
                                              activeColor: Colors.grey,
                                              selectedColor: Colors.grey,
                                              borderWidth: 1.2.sp,
                                            ),
                                            onCompleted: (String pin) {
                                              // Handle OTP submission here
                                            },
                                            onChanged: (String value) {},
                                          ),
                                          SizedBox(height: 20.h),
                                        ],
                                      ),
                                      Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.grey.shade500,
                                                Colors.grey.shade700,
                                              ],
                                              stops: [0.3, 1.0],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                            borderRadius: BorderRadius.circular(9.0),
                                          ),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.transparent,
                                              elevation: 0,
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: 80.0.sp, vertical: 6.0.sp),
                                              child: TextButton(
                                                onPressed: (){
                                                  Navigator.pushNamed(context, ResetPassword.routeName);
                                                },
                                                child: Text(
                                                  'Submit',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16.0.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20.h),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
