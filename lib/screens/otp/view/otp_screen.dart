import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:relaks_media/screens/otp/controller/otp_controller.dart';
import 'package:relaks_media/screens/reset_password_screen.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/glass_box.dart';

class OtpScreen extends StatefulWidget {
  static const String routeName = '/otp';
  String from;
  String verificationToken;

  OtpScreen({Key? key, this.from = '', this.verificationToken = ''})
      : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    homeController.getImageUrl();
    OtpController otpControllerPage = Get.put(OtpController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(homeController.bgImage.value==''?'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Black_colour.jpg/640px-Black_colour.jpg'
                  :homeController.bgImage.value),
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
                                  MediaQuery.of(context).size.height - 540.h,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 5.h),
                                          PinCodeTextField(
                                            controller: otpController,
                                            appContext: context,
                                            length: 6,
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                            ),
                                            pinTheme: PinTheme(
                                              shape: PinCodeFieldShape.box,
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                              fieldHeight: 45.h,
                                              fieldWidth: 40.w,
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
                                            onPressed: () {
                                              if (widget.from == 'signup') {
                                                otpControllerPage.verifyOtp(
                                                    token: widget
                                                        .verificationToken,
                                                    otp: otpController.text
                                                        .trim());
                                              } else {
                                                Navigator.pushNamed(context,
                                                    ResetPassword.routeName);
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.transparent,
                                              elevation: 0,
                                            ),
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
