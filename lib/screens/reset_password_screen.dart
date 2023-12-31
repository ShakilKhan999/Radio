import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/glass_box.dart';

class ResetPassword extends StatefulWidget {


  ResetPassword({Key? key,}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final newPassController = TextEditingController();

  final conPasswordController = TextEditingController();
  bool visiblepass = false;

  @override
  void dispose() {
    newPassController.dispose();
    conPasswordController.dispose();
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
                                    MediaQuery.of(context).size.height - 520,
                                width: MediaQuery.of(context).size.width - 80,
                                child: Column(
                                  children: [
                                    Text(
                                      'Reset Password',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30.sp),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'New Password',
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
                                            controller: newPassController,
                                            obscureText: !visiblepass,
                                            decoration: InputDecoration(
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
                                              border: const OutlineInputBorder(
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
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Text(
                                          'Confirm Password',
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
                                            controller: conPasswordController,
                                            obscureText: !visiblepass,
                                            decoration: InputDecoration(
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
                                              border: const OutlineInputBorder(
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
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Center(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.grey.shade500,
                                                  Colors.grey,
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
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 110.0.sp,
                                                    vertical: 6.0.sp),
                                                child: Text(
                                                  'Submit',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.0.sp,
                                                    fontWeight: FontWeight.bold,
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

