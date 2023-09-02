import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relaks_media/screens/otp_screen.dart';

import '../utils/glass_box.dart';

class ForgotPass extends StatefulWidget {
  static const String routeName='/forgetpassword';


  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    // TODO: implement dispose
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
                                height:
                                    MediaQuery.of(context).size.height - 530.h,
                                width: MediaQuery.of(context).size.width - 80.w,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30.sp),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Center(
                                        child: Text(
                                            "Don't Worry! It's happens.Please enter\nthe address associated with your account",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15.sp),
                                            textAlign: TextAlign.center)),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Email ID / Phone Number',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        SizedBox(
                                          height: 50.h,
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                              hintText: 'Enter your email or phone number',hintStyle: TextStyle(color: Colors.grey),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.2)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.2)),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.2)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Center(
                                          child: Container(
                                            height: 40.h,
                                            width: 296.w,
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
                                              borderRadius:
                                                  BorderRadius.circular(9.0),
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                elevation: 0,
                                              ),
                                              child: TextButton(
                                                onPressed: (){
                                                  Navigator.pushNamed(context, OtpScreen.routeName);
                                                },
                                                child: Text(
                                                  'Submit',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16.0.sp,
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
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
