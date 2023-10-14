import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:relaks_media/controller/authController.dart';
import 'package:relaks_media/screens/forgot_password_screen.dart';
import 'package:relaks_media/screens/login/controller/login_controller.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/glass_box.dart';
import '../../bottomnevigation.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  bool visiblepass = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    homeController.getImageUrl();
    AuthController authController = Get.put(AuthController());
    LoginController loginController = Get.put(LoginController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(homeController.bgImage.value==''?'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Black_colour.jpg/640px-Black_colour.jpg'
                  :homeController.bgImage.value),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.black.withOpacity(0.8),
            child: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(
                    parent:
                    AlwaysScrollableScrollPhysics()),
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
                                      MediaQuery.of(context).size.height - 420.h,
                                  width: MediaQuery.of(context).size.width - 80,
                                  child: Column(
                                    children: [
                                      Text(
                                        'Welcome Back',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25.sp,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Email',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          SizedBox(
                                            height: 50.h,
                                            child: TextFormField(
                                              controller:
                                                  emailController,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 15.sp),
                                              decoration: const InputDecoration(
                                                hintText: 'example@gmail.com',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: 'Poppins'),
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
                                          Text(
                                            'Password',
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
                                            child: Center(
                                              child: TextFormField(
                                                controller:
                                                    passwordController,
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 15.sp),
                                                obscureText: !visiblepass,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(8.sp),
                                                  hintText: '*************',
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontFamily: 'Poppins'),
                                                  focusedBorder:
                                                      const OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.grey,
                                                              width: 1.2)),
                                                  enabledBorder:
                                                      const OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.grey,
                                                              width: 1.2)),
                                                  border:
                                                      const OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.grey,
                                                              width: 1.2)),
                                                  suffixIcon: visiblepass
                                                      ? IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              visiblepass
                                                                  ? visiblepass =
                                                                      false
                                                                  : visiblepass =
                                                                      true;
                                                            });
                                                          },
                                                          icon: const Icon(
                                                              Icons.visibility,
                                                              color: Colors.grey))
                                                      : IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              visiblepass
                                                                  ? visiblepass =
                                                                      false
                                                                  : visiblepass =
                                                                      true;
                                                            });
                                                          },
                                                          icon: const Icon(
                                                            Icons.visibility_off,
                                                            color: Colors.grey,
                                                          )),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20.h),
                                          Center(
                                              child: TextButton(
                                                  style: TextButton.styleFrom(
                                                    minimumSize: Size.zero,
                                                    padding: EdgeInsets.zero,
                                                    tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pushNamed(context,
                                                        ForgotPass.routeName);
                                                  },
                                                  child: Text(
                                                    'Forgot Password?',
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        color: Colors.white),
                                                  ))),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Center(
                                            child: Container(
                                              height: 40.h,
                                              width: 296.w,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.grey.shade500,
                                                    Colors.grey.shade800,
                                                  ],
                                                  stops: [0.3, 1.0],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  if (
                                                      emailController
                                                              .text ==
                                                          '') {
                                                    Fluttertoast.showToast(
                                                      msg: 'Enter email address',
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      backgroundColor:
                                                          Colors.grey,
                                                      textColor: Colors.white,
                                                    );
                                                  } else if (
                                                      passwordController
                                                              .text ==
                                                          ''
                                                      //     ||
                                                      // authController
                                                      //         .passController
                                                      //         .text
                                                      //         .length <
                                                      //     6
                                                          ) {
                                                    Fluttertoast.showToast(
                                                      msg: 'Enter valid password',
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      backgroundColor:
                                                          Colors.grey,
                                                      textColor: Colors.white,
                                                    );
                                                  } else {
                                                    // authController.LogIn();
                                                    loginController.login(
                                                        email: emailController
                                                            .text
                                                            .trim(),
                                                        password:
                                                            passwordController
                                                                .text
                                                                .trim());
                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  elevation: 0,
                                                ),
                                                child: Text(
                                                  'Login',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16.0.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Center(
                                              child: Text(
                                            'or',
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.white),
                                          )),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 45.h,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9.0),
                                                  ),
                                                  child: ElevatedButton(
                                                      onPressed: () {},
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        elevation: 0,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            'images/Google.png',
                                                            width: 30.w,
                                                            height: 15.h,
                                                          ),
                                                          Text(
                                                            'Google',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Colors.white,
                                                              fontSize: 14.0.sp,
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 45.h,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9.0),
                                                  ),
                                                  child: ElevatedButton(
                                                      onPressed: () {},
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        elevation: 0,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            'images/Facebook.png',
                                                            width: 30.w,
                                                            height: 15.h,
                                                          ),
                                                          Text(
                                                            'Facebook',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Colors.white,
                                                              fontSize: 14.0.sp,
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                              ),
                                            ],
                                          )
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
      ),
    );
  }
}
